class Comment < ActiveRecord::Base
  belongs_to :article

  validates :text,
            presence: true
  validates :user_id,
            presence: true

end
