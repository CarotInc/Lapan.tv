class PostsController < ApplicationController
  def index
    @posts = Diy.all.order("id DESC").page(params[:page]).per(16)
    @topics = Topic.all.order("id DESC")
    @q = Diy.ransack(params[:q])
    @people = @q.result(distinct: true)
    @tags = ActsAsTaggableOn::Tag.all
    ids = Impression.where("created_at >= ?", Time.local(1999)).where("created_at <= ?", Time.now).group(:impressionable_id).order('count_all desc').limit(10).count.keys
    @ranking = Diy.where(:id => ids).order("field(id, #{ids.join(',')})")
  end

  def new
    @diy = Diy.new
    @q = Diy.ransack(params[:q])
    @people = @q.result(distinct: true)
    @tags = ActsAsTaggableOn::Tag.all
    @posts = Diy.all
  end

  def create
    @diy = Diy.create(diy_params)
    @diy.save
  end

  def show
    @posts = Diy.all.order("id DESC").page(params[:page]).per(16)
    @post = Diy.find(params[:id])
    @q = Diy.ransack(params[:q])
    @result = @q.result(distinct: true)
    @video = Diy.all.order("id DESC").page(params[:page]).per(16)
    @topics = Topic.all.order("id DESC")
    impressionist(@post, nil, :unique => [:session_hash])

    @page_views = @post.impressionist_count
    ids = Impression.where("created_at >= ?", Time.local(1999)).where("created_at <= ?", Time.now).group(:impressionable_id).order('count_all desc').limit(10).count.keys
    @ranking = Diy.where(:id => ids).order("field(id, #{ids.join(',')})")
    @tags = ActsAsTaggableOn::Tag.all
    @hash = Gmaps4rails.build_markers(@post) do |post, marker|
      marker.lat post.latitude
      marker.lng post.longitude
      marker.json({title: post.title})
    end
  end

  def search
    @q = Diy.search(search_params)
    @result = @q.result(distinct: true)
    @posts = Diy.all
  end

  def tag
    @post = Diy.tagged_with(tag_params)
    @tag = tag_params
    @q = Diy.ransack(params[:q])
    @people = @q.result(distinct: true)
    @posts = Diy.all
  end

  def topicshow
    @post = Diy.all.order("id DESC")
    @topics = Topic.find(id_params[:id])
    @q = Diy.ransack(params[:q])
    @result = @q.result(distinct: true)
    @posts = Diy.all
  end

  def newposts
    @posts = Diy.all.order("id DESC").page(params[:page]).per(16)
    @q = Diy.ransack(params[:q])
    @people = @q.result(distinct: true)
    @posts = Diy.all
  end

  def foryou
    @q = Diy.ransack(params[:q])
    @people = @q.result(distinct: true)
    @posts = Diy.all
  end

  def pickup
    @q = Diy.ransack(params[:q])
    @people = @q.result(distinct: true)
    ids = Impression.where("created_at >= ?", Time.local(1999)).where("created_at <= ?", Time.now).group(:impressionable_id).order('count_all desc').limit(10).count.keys
    @ranking = Diy.where(:id => ids).order("field(id, #{ids.join(',')})")
    @posts = Diy.all
  end

   private
  def diy_params
    params.require(:diy).permit(:title, :image, :text, :movie,:movie2 , :tag_list, :title1,:image1,:contents1,:title2,:image2,:contents2,:title3,:image3,:contents3,:title4,:image4,:contents4 ,:prefecture,:area,:address,:name,:station,:call,:access,:open,:close,:tabelog,:instagram,:latitude,:longitude,:category_list)
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
