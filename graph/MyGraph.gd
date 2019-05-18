extends Node
class_name MyGraph

var nodes = []
var last_node: MyGraphNode = null

func _init():
	pass

func get_neighbors(p: Vector2) -> Array:
	var node := self.get_graph_node(p)
	if node == null:
		return []
	else:
		var neighbors = []
		for n in node.neighbors:
			neighbors.append(n.position)
		return neighbors

func get_graph_node(p: Vector2) -> MyGraphNode:
	for node in nodes:
		if node.is_at(p):
			return node
	return null

func add_linked_node(p: Vector2) -> void:
	var node: MyGraphNode = get_graph_node(p)
	
	if node == null:
		node = MyGraphNode.new(p)
		nodes.append(node)
	
	if last_node != null:
		last_node.add_neighbor(node)
	
	last_node = node