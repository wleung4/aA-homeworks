class Map
	attr_reader :map
	def initialize
		@map = []
	end

	def set(key, value)
		found = false
		self.map.each do |arr| 
			if arr.first == key
				arr[1] = value
				found = true
				break
			end
		end
		self.map.push([key, value]) if !found
	end

	def get(key)
		self.map.each {|arr| return arr.last if arr.first == key}
	end

	def	delete(key)
		self.map.each_with_index {|arr, idx| return arr if self.map.delete_at(idx) if arr.first == key}
	end

	def show
		self.map
	end
end