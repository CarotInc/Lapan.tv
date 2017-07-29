class PostsController < ApplicationController
  def index
    @posts = Diy.all.order("id DESC").page(params[:page]).per(16)
    @topics = Topic.all.order("id DESC")
    @q = Diy.ransack(params[:q])
    @people = @q.result(distinct: true)
    @tags = ActsAsTaggableOn::Tag.all
  end

  def new
    @diy = Diy.new
    @q = Diy.ransack(params[:q])
    @people = @q.result(distinct: true)
  end

  def create
    Diy.create(diy_params)
  end

  def show
    @posts = Diy.find(id_params[:id])
    @q = Diy.ransack(params[:q])
    @result = @q.result(distinct: true)
  end

  def search
    @q = Diy.search(search_params)
    @result = @q.result(distinct: true)
  end

  def tag
    @post = Diy.tagged_with(tag_params)
    @q = Diy.ransack(params[:q])
    @people = @q.result(distinct: true)
  end

  def newtopic
    @topic = Topic.new
    @q = Diy.ransack(params[:q])
    @people = @q.result(distinct: true)
  end

  def create
    Topic.create(topic_params)
  end

  def topicshow
    @post = Diy.all.order("id DESC")
    @topics = Topic.find(id_params[:id])
    @q = Diy.ransack(params[:q])
    @result = @q.result(distinct: true)
  end

   private
  def diy_params
    params.require(:diy).permit(:title, :image, :text, :video, :tag_list, :title1,:image1,:contents1,:title2,:image2,:contents2,:title3,:image3,:contents3,:title4,:image4,:contents4 ,:prefecture,:area,:address,:name,:station,:call,:access,:open,:close,:url,:price, :seat,:private, :tatami,:smoke,:parking,:reserve,:card,:plus)
  end

  def topic_params
    params.require(:topic).permit(:name,:image,:tagname,:post1,:post2,:post3,:post4,:post5,:post6,:post7,:post8,:post9,:post10,:post11,:post12,:post13,:post14,:post16,:post17,:post18,:post19,:post20)
  end

    private
  def search_params
    params.require(:q).permit(:title_cont)
  end

  def tag_params
    params.require(:name)
  end

  def id_params
    params.permit(:id)
  end
end
