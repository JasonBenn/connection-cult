require 'sinatra'
require "sinatra/reloader" if development?

get '/' do
  send_file './views/index.html'
end