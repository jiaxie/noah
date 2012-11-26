class User < ActiveRecord::Base
  attr_accessible :title
  has_many :decks, :dependent => :destroy
end
