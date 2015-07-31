require 'pry-remote'
require 'sinatra'
require "sinatra/json"
require 'data_uri'
require 'json'
require 'pg'
require "sinatra/reloader" if development?

# DB = PG.connect('postgres://jasonbenn@localhost/spirals')

get '/' do
  erb :index
end

post '/spirals' do
  # generate uuid (128bit?)

  insert_row = <<-SQL
  INSERT INTO spirals (id, email, thickness, grid_size, color)
  VALUES ($1, $2, $3, $4, $5)
  SQL

  begin
    # File != web
    res = DB.exec_params(insert_row, id, [params[:email], params[:thickness], params[:gridSize], params[:color]])
  rescue PG => err
    halt 503, "Insertion error!"
  end

  id = res[0]['id']

  uri = URI::Data.new(params['image'])
  # File != web
  File.write("images/#{id}.png", uri.data)

  204
end
