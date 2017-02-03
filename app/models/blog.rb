class Blog
  include Mongoid::Document
	include Mongoid::Attributes::Dynamic
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  
  belongs_to :user
  has_many :views

  field :title,        type: String
  field :content,      type: String
  field :tags,         type: Array, default: []
  field :is_active,    type: Boolean, default: true
 
  def tags_list=(arg)
    self.tags = arg.split(',').map { |v| v.strip.downcase }
  end

  def tags_list
    self.tags.join(', ')
  end 
end
