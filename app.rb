require 'sinatra/base'
require 'sinatra/flash'
require './lib/link'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/add' do
    erb :'links/add'
  end

  post '/links' do
    flash[:notice] = 'You must submit a valid url' unless Link.create(title: params['title'], url: params['url'])
    redirect '/'
  end

  post '/links/:id/delete' do
    Link.delete(params[:id])
    redirect '/links'
  end

  get '/links/:id/edit' do
    @link = Link.select(params[:id])
    erb :'links/edit'
  end

  post '/links/:id/update' do
    Link.update(params[:id], params)
    redirect '/links'
  end

  run! if app_file == $0
end
