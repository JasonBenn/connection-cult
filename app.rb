require 'sinatra'
require "sinatra/reloader" if development?
require 'mailchimp'

get '/' do
  send_file './views/index.html'
end

post 'email_data' do 
  mailchimp = Mailchimp::API.new(a4e7beab721629d17fdd72321c70cd11-us7)
end 