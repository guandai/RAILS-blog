class User < ActiveRecord::Base
  has_secure_password
  #accepts_attributes :first_name, :last_name, :email , :name ,  :password

  has_many :articles, dependent: :destroy

  validates :first_name,
            presence: true
  validates :last_name,
            presence: true
  validates :email,
            presence: true,
            uniqueness: true,
            format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            }
  def to_s
    "#{first_name} #{last_name}"
  end

  
end