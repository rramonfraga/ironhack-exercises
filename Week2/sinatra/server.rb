require 'sinatra'
require 'sinatra/reloader' if development?

enable(:sessions)

get "/" do
  "My first Sinatra app. Let's modify the server.rb file"
end

get "/about" do
  "<p>Hi, there!</p><p>My name is Lluis Arevalo, I'm 27 year old and I'm studying in the IronHack the Bootcamp in Web developement.</p><p>Today, we are studying Sinatra!</p>"
end

get "/author/:username" do
  @user_name = params[:username]
  @current_time = Time.now.strftime("%d-%m-%y %H:%M:%S")

  erb(:author)
end

get "/pizza" do
  @ingredients = ["mozzarela", "tomatoe", "ham", "bacon"]

  erb(:pizza)
end

get "/users/:username" do
  @username = params[:username]

  erb(:users)
end

get "/hours/ago/:hour" do
  param_hour = params[:hour].to_i
  @hours_ago = (Time.now) - (param_hour * 3600)
  @hours_ago = @hours_ago.strftime("%d-%m-%y %H:%M:%S")

  erb(:hours_ago)
end

get "/session_test/:pizza" do
  session[:pizza_session] = params[:pizza]
  redirect "/session_test_show/show_pizza"
end

get "/session_test_show/show_pizza" do
  session[:pizza_session]
end