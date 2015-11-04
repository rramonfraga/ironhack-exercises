require 'pry'
require 'sinatra'
require 'yaml/store'
require 'sinatra/reloader' if development?

require_relative './lib/task.rb'
require_relative './lib/todo_list.rb'

enable(:sessions)

get "/" do
  erb(:login)
end

post "/login" do
  todo_list = TodoList.new params[:username]
  session[:list] = todo_list

  redirect '/tasks'
end

get "/tasks" do
  @todo_list = session[:list]
  
  erb(:task_index)
end

get "/new_task" do
  erb(:new_task)
end

post "/create_task" do
  task = Task.new params[:task]
  todo_list = session[:list]
  todo_list.add_task task
  todo_list.save
  redirect '/tasks'
end