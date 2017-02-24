class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
#  before_action :authenticate_user!
  include CanCan::ControllerAdditions

  rescue_from Mongoid::Errors::DocumentNotFound, :with => :not_found

  def not_found
    redirect_to root_path, notice: "Not found!"
  end

  
  def index
  end
  
  def after_sign_in_path_for(resource)
    admin_blogs_path
  end
end
