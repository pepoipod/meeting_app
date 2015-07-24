class TopicsLabel < ActiveRecord::Base
  belongs_to :topic
  belongs_to :label
end
