class BlogsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @blogs = Blog.all.order("created_at desc").paginate(:page => params[:page], :per_page => 3)
  end
  
  
  def show
      @blog = Blog.find(params[:id])
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
