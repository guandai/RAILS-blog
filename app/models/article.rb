class Article < ActiveRecord::Base
  attr_accessible :text, :title , :user

  belongs_to :user
  has_many :comment
  
  cattr_reader :per_page
  
  @@per_page = 100

end
