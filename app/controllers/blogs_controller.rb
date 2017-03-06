class BlogsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :update_like_or_dislike_count]
  
  def index
    scope = Blog
    if params[:tag].present?
      scope = scope.where(tags: params[:tag].titleize)
    end  
    @blogs = scope.order("created_at desc").paginate(:page => params[:page], :per_page => 10)
  end
  
  
  def show
    session[:viewed] ||= []
    @blog = Blog.find(params[:id])
    @comment = Comment.new  
    @blog_comments = @blog.comments
    unless session[:viewed].include?(@blog.id.to_s)
      session[:viewed] << @blog.id.to_s
      @blog.update_attribute(:views, (@blog.views + 1))
    end
    render layout: "blog"
  end
  
  def update_like_or_dislike_count
    @blog = Blog.find(params[:id])
    session[:liked] ||= []
    session[:disliked] ||= []
    case params[:type]
      when "like"
        unless session[:liked].include?(@blog.id.to_s)
          session[:liked] << @blog.id.to_s
          @blog.update_attribute(:likes, (@blog.likes + 1))
        end  
      when "dislike"
        unless session[:disliked].include?(@blog.id.to_s)
          session[:disliked] << @blog.id.to_s
          @blog.update_attribute(:dislikes, (@blog.dislikes + 1))
        end 
    end
    respond_to do |format|
      format.html { redirect_to blog_path(@blog) }
      format.js { render layout: false }
    end
  end
  
  
  private
  def load_blog
    @blog = Blog.find(params[:id])
  end
  
  def blog_params
    params.require(:blog).permit(:title, :content, :tags, :tags_list, :user_id, :is_active)
  end
end
