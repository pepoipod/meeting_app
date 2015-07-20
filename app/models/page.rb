class Page < ActiveRecord::Base
  belongs_to :user
  has_many :pages_category
  has_many :category, :through => :pages_category
end
