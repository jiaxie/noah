class Feature < ActiveRecord::Base
  attr_accessible :name, :deck_id
  belongs_to :deck
  has_many :blogs
end
