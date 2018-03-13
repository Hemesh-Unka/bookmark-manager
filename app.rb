require 'sinatra/base'
require './lib/link'

class BookmarkManager < Sinatra::Base
  get '/' do
    @links = Link.all
    erb :index
  end

  get '/input-link' do
    erb :input_link
  end

  post '/add-link' do
    p params
    redirect '/'
  end

  run! if app_file == $0
end
