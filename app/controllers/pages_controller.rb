class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:about_me, :contact]
  
  def about_me
    
  end
  
  def contact
  end
end  
