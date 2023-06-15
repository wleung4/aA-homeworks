def sluggish_octopus(fish) # o(n^2)
	max_length = fish[0].length
	index = 0
	fish.each_with_index do |ele, idx1|
		fish.each_with_index do |el, idx2|
			if el.length > max_length
				max_length = el.length
				index = idx2
			end
		end
	end
	fish[index]
end

class Array
	def merge_sort(&prc)
		prc ||= Proc.new{ |l, r| l <=> r}
		return self if self.length < 2

		mid = self.length / 2
		left_sort = merge_sort(self[0...mid], &prc)
		right_sort = merge_sort(self[mid + 1..-1], &prc)
		merge(left_sort, right_sort, &prc)
	end

	def merge(left, right, &prc)
		sorted = []
		until left.empty? || right.empty?
			case prc.call(left[0], right[0])
			when -1
				sorted = left.shift
			when 0 
				sorted = left.shift
			when 1
				sorted = right.shift
			end
		end
		sorted + left + right
	end
end 

def dominant_octopus(fish) # o(nlogn)
	prc = Proc.new{ |l, r| r.length <=> l.length}
	fish.merge_sort(&prc)[0]
end

def clever_octopus(fish) # o(n)
	longest = fish[0]
	fish.each do |ele|
		longest = ele if longest.length > ele.length
	end
	longest
end


def slow_dance(direction, tiles) # o(n)
	tiles.each_with_index do |tile, index|
		return index if tile == direction
	end
end

def fast_dance(direction , tiles) # o(1)
	# hash = Hash.new
	# tiles.each_with_index do |tile, i|
	# 	hash[tile] = i
	# end
	tiles[direction]
end

# fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# p fish.merge_sort
# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up"]
# tiles_hash = {
#     "up" => 0,
#     "right-up" => 1,
#     "right"=> 2,
#     "right-down" => 3,
#     "down" => 4,
#     "left-down" => 5,
#     "left" => 6,
#     "left-up" => 7
# }

# p slow_dance("up", tiles_array) # 0
			   
# p slow_dance("right-down", tiles_array) # 3

# p fast_dance("up", tiles_hash) # 0

# p fast_dance("right-down", tiles_hash) # 3