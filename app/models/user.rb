class User < ActiveRecord::Base

  has_one :broker_profile
  # accepts_nested_attributes_for :broker_profile
  rolify

  # after_create :build_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
