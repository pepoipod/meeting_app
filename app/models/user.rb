class User < ActiveRecord::Base

  has_many :topic
  has_many :comment

  has_many :users_meeting
  has_many :meeting, :through => :users_meeting
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness: true
end
