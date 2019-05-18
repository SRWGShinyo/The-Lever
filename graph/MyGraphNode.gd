extends Node
class_name MyGraphNode

var neighbors = []
var position: Vector2

const TOLERANCE := 30

func _init(p: Vector2):
	self.position = p
	
	
func is_at(p: Vector2) -> bool:
	return (self.position - p).length() <= TOLERANCE

func add_neighbor(node: MyGraphNode):
	if self == node:
		return
	if not self.is_neighbor(node):
		neighbors.append(node)
		node.neighbors.append(self)

func is_neighbor(node: MyGraphNode):
	for n in neighbors:
		if n == node:
			return true
	return false