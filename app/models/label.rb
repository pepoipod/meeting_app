class Label < ActiveRecord::Base
  has_many :topics_label
  has_many :topic, :through => :topics_label
end
