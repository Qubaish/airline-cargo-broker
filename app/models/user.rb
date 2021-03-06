class User < ActiveRecord::Base

  has_one :broker_profile
  has_many :broker_quotes
  accepts_nested_attributes_for :broker_profile
  has_many :airplanes
  belongs_to :airline
  validates :email, :uniqueness => { :case_sensitive => false }
  accepts_nested_attributes_for :airplanes

  has_many :airline_quotes, :through => :bids
  has_many :bids

  rolify

  # after_create :build_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable,:registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
