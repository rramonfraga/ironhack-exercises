class Project < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :name, length: { maximum:30 }
  validates :name, format: { with: /\A[a-zA-ZÑñ0-9\ ]+\z/ }

  has_many :participations
  has_many :people, through: :participations
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

  def month_entries(year, month)
    from = Date.new(year, month, 1)
    to = from.end_of_month
    
    self.entries.where(date: from..to)
  end

  def total_hours_in_month
    minutes = self.entries.reduce(0) do |total, entry|
      total += entry.minutes + entry.hours * 60
    end

    (minutes/60.0).round(2)
  end
end