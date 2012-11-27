class Blog < ActiveRecord::Base
  attr_accessible :title, :content, :deck_id
  belongs_to :user
end
