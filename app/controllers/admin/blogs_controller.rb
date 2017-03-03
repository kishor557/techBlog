class Admin::BlogsController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'
  
  def index
    @blogs = Blog.all.order("created_at desc").paginate(:page => params[:page], :per_page => 10)
  end
  
  def new
    @blog = current_user.blogs.new
  end
  
  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      redirect_to admin_blogs_path, notice: "Posted Successfully!"
    else
      render action: "new"
    end
  end
  
  def edit
    @blog = Blog.find(params[:id])
  end
  
  def show
      @blog = Blog.find(params[:id])
  end
  
  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to admin_blogs_path, notice: "Post Updated Successfully!"
    else
      render action: "new"
    end
  end
  
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to admin_blogs_path
  end
  
  private
  def load_blog
    @blog = Blog.find(params[:id])
  end
  
  def blog_params
    params.require(:blog).permit(:title, :content, :tags, :tags_list, :user_id, :is_active, :created_at, :updated_at)
  end
end
