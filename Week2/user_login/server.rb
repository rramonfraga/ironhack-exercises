require 'sinatra'
require 'sinatra/reloader' if development?
require_relative './lib/models.rb'

enable(:sessions)

get "/" do
  erb(:index)
end

post "/" do
  user = params[:username]
  password = params[:password]

  if CheckLogin.valid_user_password?(user, password)
    session[:username] = user
    redirect "/private_page"
  else
    @error = "Invalid user and password"
  end

  erb(:index)
end

get "/private_page" do
  if(session[:username] != "")
    erb(:private_page)
  else
    redirect "/"
  end
end

post "/logout" do
  session[:username] = ""
  redirect "/"
end