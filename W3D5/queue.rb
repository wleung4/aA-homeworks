class Queue # First in first out
	def initialize
		@queue = []
	end

	def enqueue(el)
		@queue.push(el)
	end

	def dequeue
		@queue.shift
	end

	def peek
		@queue.first
	end
end