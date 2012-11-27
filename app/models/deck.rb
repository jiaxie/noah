class Deck < ActiveRecord::Base
  attr_accessible :name, :user_id
  has_many :features, :dependent => :destroy
  belongs_to :user
end
