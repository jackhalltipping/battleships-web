require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/name' do
    @name = params[:name]
    #@name2 = params[:name2]
    erb :name
  end

  set :views, proc { File.join(root, '..', 'views') }
  # start the server if ruby file executed directly
  run! if app_file == $0
end
