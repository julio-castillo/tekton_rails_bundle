class Admin < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :confirmable
end
