class BlogsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    scope = Blog
    if params[:tag].present?
      scope = scope.where(tags: params[:tag].titleize)
    end  
    @blogs = scope.order("created_at desc").paginate(:page => params[:page], :per_page => 10)
  end
  
  
  def show
    @blog = Blog.find(params[:id])
    @comment = Comment.new  
    @blog_comments = @blog.comments
  end
  
  def update_view_count
    @blog = Blog.find(params[:id])
  end
  
  
  private
  def load_blog
    @blog = Blog.find(params[:id])
  end
  
  def blog_params
    params.require(:blog).permit(:title, :content, :tags, :tags_list, :user_id, :is_active)
  end
end
