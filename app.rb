require 'sinatra/base'
require 'sinatra/flash'
require './lib/link'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @links = Link.all
    erb :index
  end

  get '/add-link' do
    erb :add_link
  end

  get '/update-link' do
    @link = Link.select(params[:id])
    erb :update_link
  end

  post '/update-link' do
    Link.update(params[:id], params[:title], params[:url])
    redirect '/'
  end

  post '/create-link' do
    flash[:notice] = 'You must submit a valid url' unless Link.create(title: params['title'], url: params['url'])
    redirect '/'
  end

  post '/delete-link' do
    Link.delete(params[:id])
    redirect '/'
  end

  run! if app_file == $0
end
