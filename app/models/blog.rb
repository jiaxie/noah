class Blog < ActiveRecord::Base
  attr_accessible :title, :content, :feature_id
  belongs_to :feature
end
