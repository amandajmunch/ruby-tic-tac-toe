class Player
	attr_accessor :name, :move, :history
	def initialize(name, move, history)
		@name=name
		@move=move
		@history=history
	end
end
