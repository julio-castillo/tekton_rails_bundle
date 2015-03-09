class AdminUser < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true
end
