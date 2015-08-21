require 'sinatra'
require "sinatra/reloader" if development?
require 'mailchimp'

get '/' do
  send_file './views/index.html'
end