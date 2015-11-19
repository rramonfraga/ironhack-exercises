class Person < ActiveRecord::Base
  validates :name, presence: true

  has_many :participations
  has_many :projects, through: :participations

  def select_no_associated_projects
    Project.all.select do |project|
      !self.projects.find_by(id: project.id)
    end
  end
end
