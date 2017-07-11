class PostsController < ApplicationController
  def index
    @posts = Diy.all.order("id DESC").page(params[:page]).per(30)
    @q = Diy.ransack(params[:q])
    @people = @q.result(distinct: true)
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

   private
  def diy_params
    params.require(:diy).permit(:title, :image, :text, :video, :contents, :tag_list)
  end

    private
  def search_params
    params.require(:q).permit(:title_cont)
  end

  def id_params
    params.permit(:id)
  end
end
