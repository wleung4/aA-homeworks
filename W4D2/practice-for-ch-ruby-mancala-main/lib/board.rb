class Board
  attr_accessor :cups

  def initialize(name1, name2)
	@player_1 = name1
	@player_2 = name2
	@cups = Array.new(14){[]}
	place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
	(0..5).each {|i| 4.times {|j| @cups[i] << :stone }}
	(7..12).each {|i| 4.times {|j| @cups[i] << :stone }}
  end

  def valid_move?(start_pos)
	if start_pos < 0 || start_pos == 6 || start_pos > 12 
		raise 'Invalid starting cup'
	else
		if cups[start_pos].empty?
			raise 'Starting cup is empty'
		end
	end
	true
  end

  def make_move(start_pos, current_player_name)
	num_stones = cups[start_pos]
	cups[start_pos] = []

	start_index = start_pos + 1
	index = 0
	until num_stones.empty?
		curr_index = (start_index + index) % 14
		cups[curr_index] << num_stones.pop
		index += 1
	end
	render
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end