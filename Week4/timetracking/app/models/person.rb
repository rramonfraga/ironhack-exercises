class Person < ActiveRecord::Base
  validates :name, presence: true

  has_many :participations
  has_many :projects, through: :participations
end
