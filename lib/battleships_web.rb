require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
enable :sessions

  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    erb :index
  end

  get '/new_game1' do
    if (params[:name1] == '' || params[:name1] == nil)
      erb :new_game1
    else
      session[:name1] = params[:name1]
      redirect "/new_game2"
    end
  end
  get '/new_game2' do
    if (params[:name2] == '' || params[:name2] == nil)
      erb :new_game2
    else
      session[:name2] = params[:name2]
      redirect "/start_game"
    end
  end

  get '/start_game' do
    $game = Game.new Player, Board
    # $game.player_2.place_ship Ship.destroyer, 'A1'
    erb :start_game
  end

  get '/board' do
    begin
      unless (params[:ship] == '' || params[:ship] == nil)
      $game.player_1.place_ship Ship.send(params[:ship]), params[:coords], params[:direction]
      end
    rescue RuntimeError => @error
    end

    @board = $game.own_board_view($game.player_1)
    erb :board
  end

  get '/player2board' do
      
    begin
      unless (params[:ship] == '' || params[:ship] == nil)
      $game.player_2.place_ship Ship.send(params[:ship]), params[:coords], params[:direction]
      end
    rescue RuntimeError => @error
    end

    @board2 = $game.own_board_view($game.player_2)
    erb :player2board

  end

  get '/firing1' do 
    coords = params[:coords]
    begin
      if coords && coords != ""
        @shot_success = $game.player_1.shoot coords.to_sym
        @opponent_board = $game.opponent_board_view $game.player_1
      else
          erb :firing1
        @coord_error = 'Enter coordinate'
       end
    rescue RuntimeError => @coord_error
    end
    erb :firing1
  end

  get '/firing2' do 
    coords = params[:coords]
    begin
      if coords && coords != ""
        @shot_success = $game.player_2.shoot coords.to_sym
        @opponent_board = $game.opponent_board_view $game.player_2
      else
         erb :firing2
        @coord_error = 'Enter coordinate'
       end
    rescue RuntimeError => @coord_error
    end
    erb :firing2
  end

  # get '/firing_result' do

  #   erb :firing_result
  # end




  get '/bomb' do
    unless (params[:coords] == '' || params[:coords] == nil)
      $game.player_1.shoot params[:coords].to_sym
    end
    @board = $game.opponent_board_view($game.player_2)
    erb :bomb
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end