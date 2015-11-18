class Project < ActiveRecord::Base
  has_many :entries

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

  def total_hours_in_month(year, month)
    from = Date.new(year, month, 1)
    to = from.end_of_month

    minutes = self.entries.where(date: from..to).reduce(0) do |total, entry|
      total += entry.minutes + entry.hours * 60
    end

    minutes/60.0
  end
end