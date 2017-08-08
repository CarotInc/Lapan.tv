class TopicsController < ApplicationController

  def index
    @topics = Topic.all.order("id DESC")
    @q = Diy.ransack(params[:q])
    @people = @q.result(distinct: true)
  end

  def new
    @topic = Topic.new
    @q = Diy.ransack(params[:q])
    @people = @q.result(distinct: true)
  end

  def create
    @post = Topic.create(topic_params)
    @post.save
  end

  def topic_params
    params.require(:topic).permit(:name,:image,:tagname,:post1,:post2,:post3,:post4,:post5,:post6,:post7,:post8,:post9,:post10,:post11,:post12,:post13,:post14,:post16,:post17,:post18,:post19,:post20)
  end
end
