require 'sinatra'

get '/' do
  
end

get '/real_page' do

end

get '/hi' do
  redirect '/real_page'
end

get '/new_page' do

end