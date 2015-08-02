class Topic < ActiveRecord::Base
  belongs_to :user
  belongs_to :page

  has_many :topics_label
  has_many :label, :through => :topics_label

  has_many :comments, :as => :commentable
end
