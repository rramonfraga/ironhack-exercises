class Project < ActiveRecord::Base
  def self.iron_find(parameters)
    where('id = ?', parameters).first
  end

  def self.clean_old
    where('created_at < ?', Date.current - 1.week).destroy_all
  end

  def self.last_created_projects(max)
    order(created_at: :desc).limit(max)
  end

  def self.first_updated_projects(max)
    order(updated_at: :asc).limit(max)
  end
end
