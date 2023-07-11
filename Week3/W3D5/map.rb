class Map
	def initialize
		@map = []
	end

	def set(key, value)
		found = false
		@map.each do |arr| 
			if arr.first == key
				arr[1] = value
				found = true
				break
			end
		end
		@map.push([key, value]) if !found
	end

	def get(key)
		@map.each {|arr| return arr.last if arr.first == key}
	end

	def	delete(key)
		@map.each_with_index {|arr, idx| return arr if @map.delete_at(idx) if arr.first == key}
	end

	def show
		@map.dup
	end
end