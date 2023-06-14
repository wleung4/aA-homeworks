class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
	@sequence_length = 1
	@game_over = false
	@seq = []
  end

  def play
	self.take_turn
	while !game_over
		self.take_turn
	end

	if @game_over
		self.game_over_message
		self.reset_game
	end
  end

  def take_turn
	self.show_sequence
	self.require_sequence
	while !@game_over
		self.round_success_message
		sequence_length += 1
	end
  end

  def show_sequence
	self.add_random_color
	(0...sequence_length).each do |i|
		puts seq[i]
	end
  end

  def require_sequence
  	input = gets.chomp.split

	@game_over = true if input.length != sequence_length

	if !@game_over
		@seq.each_with_index do |color, idx|
			if color != input[idx]
				@game_over = true 
				break
			end
		end
	end
  end

  def add_random_color
	colors = ["red", "blue", "yellow", "green"]
	seq << colors.sample
  end

  def round_success_message
	puts "Round success"
  end

  def game_over_message
	puts "Game over"
  end

  def reset_game
	@sequence_length = 1
	@game_over = false
	@seq = []
  end
end