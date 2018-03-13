require 'sinatra/base'
require './lib/link'

class BookmarkManager < Sinatra::Base
  get '/' do
    @links = Link.all
    erb :index
  end

  get '/add-link' do
    erb :add_link
  end

  post '/create-link' do
    Link.create(url: params[:url])
    redirect '/'
  end

  run! if app_file == $0
end
