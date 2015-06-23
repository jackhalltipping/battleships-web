require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/name' do
    $player1 = params[:player1]
    erb :name
  end

  get '/board' do
    $game = Game.new Player, Board
    @guess = params[:guess]
    erb :board
  end

  set :views, proc { File.join(root, '..', 'views') }
  # start the server if ruby file executed directly
  run! if app_file == $0
end
