class User < ActiveRecord::Base
  attr_accessible :name, :password
  has_many :decks, :dependent => :destroy
end
