class Board
	attr_accessor :spaces
	def initialize
		@spaces = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
	end

	def display_board
		puts " #{@spaces[0]} | #{@spaces[1]} | #{@spaces[2]} "
		puts "-----------"
		puts " #{@spaces[3]} | #{@spaces[4]} | #{@spaces[5]} "
		puts "-----------"
		puts " #{@spaces[6]} | #{@spaces[7]} | #{@spaces[8]} "
	end

	def modify_board(player, location)
		@spaces[location]=player.move
	end
end

