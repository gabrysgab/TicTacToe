class TicTacToe
	attr_accessor :current_player, :board, :player



	def new_game
	end


	def new_board()
		@board = Board.new
	end

	def new_player(name, symbol)
		@player = Player.new(name, symbol)
	end

	def players
		Player.players
	end


	def first_player #choosing the first player
		changing_player(Player.players.sample)
	end


	def changing_player(player) 
		@current_player = player		
	end


	def turn  #changing players beetween the turns
		if @current_player.symbol == "cross"
			Player.players.each do |p|
				if p.symbol == "circle"
					changing_player(p)
				end
			end

		elsif @current_player.symbol == "circle"
			Player.players.each do |p|
				if p.symbol == "cross"
					changing_player(p)
				end
			end
		end
	end
end




	class Board
		def initialize
			@board = Hash.new()
			9.times do |i|
				@board[i] = "empty"
				i += 1
			end
		end



		def insert(position, player)
			@board[position] = player.symbol
		end


		def check_board()
		end
	end


	class Player
		attr_accessor :name, :symbol
		@@players = []
		def initialize(name, symbol)
			@name = name
			@symbol = symbol
			@@players.push(self)
		end

		def self.players
			@@players
		end

end



gra = TicTacToe.new
gra.new_player("Mateusz","circle")
gra.new_player("Patrycja","cross")
gra.first_player
puts gra.current_player.name
puts "zmiana"
gra.turn
puts gra.current_player.name

