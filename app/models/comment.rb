class Comment < ActiveRecord::Base
  attr_accessible :article_id, :text, :user_id
  belongs_to :article
end
