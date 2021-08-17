require 'sinatra'

patch '/' do
  
end

delete '/' do
  
end

get '/hello' do
  "Our params: #{params}"
end

post '/' do
  request.body
end
