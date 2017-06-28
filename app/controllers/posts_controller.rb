class PostsController < ApplicationController
  def index
    @posts = Diy.all.order("id DESC").page(params[:page]).per(30)
    @q = Diy.ransack(params[:q])
    @people = @q.result(distinct: true)
  end

  def new
    @posts = Diy.new
  end

  def create
    Diy.create(diy_params)

  end

  def show
    @posts = Diy.find(id_params[:id])
  end

   private
  def diy_params
    params.permit(:title, :image, :text, :video, :contents)
  end

  def id_params
    params.permit(:id)
  end
end
