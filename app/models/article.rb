class Article < ActiveRecord::Base
  
  belongs_to :user
  has_many :comment
  
  cattr_reader :per_page
  
  @@per_page = 100

end
