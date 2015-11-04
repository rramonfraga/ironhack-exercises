require 'pry'
require 'yaml/store'

module ManageData
  def save
    @todo_store = YAML::Store.new(@file_url)
    @todo_store.transaction do
      @todo_store[@user] = @tasks
    end
  end

  def load_tasks
    @tasks_hash = YAML.load_file(@file_url)
    @tasks_hash[@user].each do |task|
      @tasks << task
    end
  end
end

class TodoList
  attr_reader :tasks, :user
  include ManageData

  def initialize user_name
    @file_url = './public/tasks.yml'
    @tasks = []
    @user = user_name
    load_tasks
  end

  def add_task task
    @tasks << task
  end

  def delete_task task_id
    @tasks.delete_if { |task| task.id == task_id }
  end

  def find_task_by_id task_id
    @task = @tasks.find { |task| task.id == task_id }
  end

  def sort_by_created order_by = "DESC"
    if(order_by == "DESC")
      @tasks.sort do | task1, task2 |
        task2.created_at <=> task1.created_at
      end
    elsif(order_by == "ASC")
      @tasks.sort do | task1, task2 |
        task1.created_at <=> task2.created_at
      end
    end
  end

  
end