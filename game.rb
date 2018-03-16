require_relative 'board'
require_relative 'player'
require_relative 'computer'
include Computer

# winning combinations
win_array=[[0,1,2], [0,4,8], [0,3,6], [1,4,7], [2,5,8], [2,4,6], [3,4,5], [6,7,8]]

puts "Welcome to Tic Tac Toe!"
puts "Please enter your name:"
	p1=Player.new(gets.chomp, "X", [])
	p2=Player.new("Computer", "O",[])
	board=Board.new
	move_number=1
	win=false
	while win==false
		if move_number%2==1
			current_player=p1
			if move_number==1
				board.display_board
			end
			puts "#{current_player.name}'s turn: Where would you like your move to be?"
			location=gets.chomp.to_i
			while (0..8).to_a.include?(location)==false
				puts "Invalid response: Please submit a number between 0 and 8."
				location=gets.chomp.to_i
			end
			while board.spaces[location]!=" "
				puts "That spot is already taken!"
				puts "#{current_player.name}'s turn: Where would you like your move to be?"
				location=gets.chomp.to_i
			end
			current_player.history << location
			board.modify_board(current_player, location)
			win_array.each do |element|
				if (current_player.history&element).sort==element
					win=true
				end
			end
			if win==true
				puts "#{current_player.name} wins the game!"
				board.display_board
			elsif move_number==9
				puts "It's a tie!"
				win=true
				board.display_board
			else
				move_number+=1
				board.display_board
			end
		else
			current_player=p2
			location=Computer.computer_play(p1.history,p2.history)
			current_player.history << location
			board.modify_board(current_player, location)
			win_array.each do |element|
				if (current_player.history&element).sort==element
					win=true
				end
			end
			if win==true
				puts "#{current_player.name} wins the game!"
				board.display_board
        # play_again
			elsif move_number==9
				puts "It's a tie!"
				win=true
				board.display_board
        # play_again
			else
				move_number+=1
				puts "Computer's move:"
				board.display_board
			end
		end

  # def play_again
  #     loop do
  #     puts "\ndo you want to play again?\n"
  #     choice = gets.strip
  #     case choice.upcase
  #     when "Y" then return true
  #     when "N" then return false
  #       if true
  #         board=Board.new
  #         move_number=1
  #         win=false
  #       else
  #         exit
  #       end
  #     end
  #   end
  # end

end
















