class View
  include Mongoid::Document
	include Mongoid::Attributes::Dynamic
  include Mongoid::Timestamps
  
  belongs_to :blog

  field :time_spent,   type: String
  field :ip,      type: String
  field :referrer,         type: Array, default: []
 
#  after_save :update_blog_info
#  
#  def update_blog_info
#      self.parent.update()
#  end
 
end
