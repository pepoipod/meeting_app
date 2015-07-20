class Category < ActiveRecord::Base
  has_many :pages_category
  has_many :page, :through => :pages_category
end
