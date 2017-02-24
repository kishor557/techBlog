class Admin::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_blog
  layout 'admin'
  
  def index
    @comments = @blog.comments.order("created_at desc").paginate(:page => params[:page], :per_page => 3)
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to admin_blog_comments_path(@blog), notice: "Updated Successfully!"
    else
      render action: "new"
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_blog_comments_path(@blog)
  end
  
  private
  def load_blog
    @blog = Blog.find(params[:blog_id])
  end
  
  def comment_params
    params.require(:comment).permit(:name, :desc, :blog_id)
  end
end
