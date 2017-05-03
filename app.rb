ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative './models/link'
require_relative 'data_mapper_setup'

class Bookmark < Sinatra::Base

  get '/link' do
    @link = Link.all
    erb :'links/index'
  end

  get '/link/new' do
    erb :'links/new'
  end

    post '/link' do
      link = Link.new(title: params[:title], url: params[:url])
      tags = Tag.first_or_create(name: params[:tags])
      link.tag << tags
      link.save
      redirect '/link'
    end
end
