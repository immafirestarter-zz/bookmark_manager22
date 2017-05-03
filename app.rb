ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative './models/link'

class Bookmark < Sinatra::Base

  get '/link' do
    @link = Link.all
    erb :'links/index'
  end

  get '/link/new' do
    erb :'links/new'
  end

    post '/link' do
      Link.create(title: params[:title], url: params[:url])
      redirect '/link'
    end
end
