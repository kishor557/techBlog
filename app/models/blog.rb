class Blog
  include Mongoid::Document
	include Mongoid::Attributes::Dynamic
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  
  belongs_to :user
  has_many :comments, dependent: :destroy

  field :title,        type: String
  field :content,      type: String
  field :tags,         type: Array, default: []
  field :is_active,    type: Boolean, default: true
  field :likes,        type: Integer, default: 0
  field :dislikes,     type: Integer, default: 0
  field :views,        type: Integer, default: 0
 
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
 
  def tags_list=(arg)
    self.tags = arg.split(',').map { |v| v.strip.titleize }
  end

  def tags_list
    self.tags.join(', ')
  end
end
