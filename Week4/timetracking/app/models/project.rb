class Project < ActiveRecord::Base
  def self.iron_find(parameters)
    where('id = ?', parameters).first
  end
end
