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
    @diy = Diy.create(diy_params)
    @diy.save
  end

  def show
    @post = Diy.find(id_params[:id])
    @q = Diy.ransack(params[:q])
    @result = @q.result(distinct: true)
    @video = Diy.all.order("id DESC").page(params[:page]).per(16)
    @topics = Topic.all.order("id DESC")
    REDIS.incr "posts/daily/#{Date.today.to_s}/#{@post.id}"
    # PV数1位から20位までの記事を取得
    ids = REDIS.zrevrange "posts/dayly/#{Date.today.to_s}", 0, 10
    @posts = Diy.where(id: ids)
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

  def topicshow
    @post = Diy.all.order("id DESC")
    @topics = Topic.find(id_params[:id])
    @q = Diy.ransack(params[:q])
    @result = @q.result(distinct: true)
  end

  def newposts
    @posts = Diy.all.order("id DESC").page(params[:page]).per(16)
    @q = Diy.ransack(params[:q])
    @people = @q.result(distinct: true)
  end

  def foryou
    @q = Diy.ransack(params[:q])
    @people = @q.result(distinct: true)
  end

  def pickup
    @q = Diy.ransack(params[:q])
    @people = @q.result(distinct: true)
  end

   private
  def diy_params
    params.require(:diy).permit(:title, :image, :text, :video, :tag_list, :title1,:image1,:contents1,:title2,:image2,:contents2,:title3,:image3,:contents3,:title4,:image4,:contents4 ,:prefecture,:area,:address,:name,:station,:call,:access,:open,:close,:url,:price, :seat,:private, :tatami,:smoke,:parking,:reserve,:card,:plus,:category_list)
  end

    private
  def search_params
    params.require(:q).permit(:title_or_station_or_area_or_name_or_prefecture_or_title1_cont)
  end

  def tag_params
    params.require(:name)
  end

  def id_params
    params.permit(:id)
  end
end
