class Friendship < ActiveRecord::Base
  attr_accessible :accepted, :friendA, :friendB, :status
end
