class Comment
  include Mongoid::Document
	include Mongoid::Attributes::Dynamic
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  belongs_to :blog
    
  field :name, type: String
  field :desc, type: String

end
