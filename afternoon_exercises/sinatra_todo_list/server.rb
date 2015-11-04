require 'sinatra'
require 'sinatra/reloader' if development?

require_relative './lib/task.rb'
require_relative './lib/todo_list.rb'

