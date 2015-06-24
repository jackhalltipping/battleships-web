require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
  get '/' do
    $player1 = params[:name]
    if $player1 != '' && $player1
      redirect '/newgame'
    else
      erb :index
    end
  end

  get '/newgame' do
    $game = Game.new Player, Board
    erb :newgame
  end

  get '/placeships' do
    @ship = params[:Ship]
    @location = params[:location]
    @direction = params[:direction]
    if @location != '' && @location
      #$game.player_1.place_ship Ship.@ship, @location, @direction
      #cant place ship, need to reload page after placing
    else
      erb :placeships
    end
  end

  set :views, proc { File.join(root, '..', 'views') }
  # start the server if ruby file executed directly
  run! if app_file == $0
end
