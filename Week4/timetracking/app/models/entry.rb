class Entry < ActiveRecord::Base
  validates :hours, :minutes, numericality: { only_integer: true }
  validates :date, :hours, :minutes, :project_id, presence: true

  belongs_to :project
end