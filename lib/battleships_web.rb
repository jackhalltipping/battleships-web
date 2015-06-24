require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
enable :sessions

  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    erb :index
  end

  get '/new_game' do
    if (params[:name] == '' || params[:name] == nil)
      erb :new_game
    else
      session[:name] = params[:name]
      redirect "/start_game"
    end
  end

  get '/start_game' do
    $game = Game.new Player, Board
    erb :start_game
  end

  get '/board' do
    unless (params[:ship] == '' || params[:ship] == nil)
      begin
        $game.player_1.place_ship Ship.send(params[:ship]), params[:coords], params[:direction]
      rescue RuntimeError => @error
      end
    end

    @board = $game.own_board_view($game.player_1)
    erb :board
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end