require 'set'

class GraphNode
	attr_accessor :val, :neighbors
	def initialize(val)
		@val = val
		@neighbors = neighbors
	end

	def bfs(starting_node, target_node)
		visited = Set.new()
		queue = [starting_node]
		while !queue.empty?
			shift = queue.shift
			visited.add(shift)
			shift.neighbors.each do |neighbor|
				if neighbor.val == target_node
					return neighbor.val
				else
					if !visited.include?(shift)
						queue << neighbor
					end
				end
			end
		end
		nil
	end
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p a.bfs(a, "b")
p a.bfs(a, "f")