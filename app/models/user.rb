class User < ActiveRecord::Base
  extend Devise::Models
  include DeviseTokenAuth::Concerns::User
  devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :trackable, :validatable
  has_many :messages

end
