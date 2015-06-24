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

  get '/newgame' do
    $game = Game.new Player, Board
    @submarine_coordinate = params[:submarine_coordinate]
    @submarine_direction = params[:submarine_direction]
    @destroyer_coordinate = params[:destroyer_coordinate]
    @destroyer_direction = params[:destroyer_direction]
    @cruiser_coordinate = params[:cruiser_coordinate]
    @cruiser_direction = params[:cruiser_direction]
    @battleship_coordinate = params[:battleship_coordinate]
    @battleship_direction = params[:battleship_direction]
    @aircraft_carrier_coordinate = params[:aircraft_carrier_coordinate]
    @aircraft_carrier_direction = params[:aircraft_carrier_direction]
    erb :newgame
  end

  set :views, proc { File.join(root, '..', 'views') }
  # start the server if ruby file executed directly
  run! if app_file == $0
end
