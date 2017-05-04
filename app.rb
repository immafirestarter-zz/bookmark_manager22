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
      links = Link.new(url: params[:url], title: params[:title])
      johhns = params[:tag].split(', ')
      johhns.each do |y|
      tag = Tag.first_or_create(name: y)
      links.tags << tag
      links.save
    end
      redirect '/link'
    end

    get '/tags/:name' do
      links = Link.all
      @link = []
      links.each do |x|

        @link << x if x.tags.map(&:name).include?(params[:name])
      end
      erb :'links/index'
    end
end
