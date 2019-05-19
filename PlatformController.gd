extends Node

var move_queue := []
var waiting := 0

var moving := false

func _ready():
	pass

func _process(delta):
	if waiting == 0 and move_queue.size() != 0 and moving:
		var todo: String = move_queue.front()
		move_queue.pop_front()
		for platform in get_tree().get_nodes_in_group("Platform"):
			var pf := platform as Platform
			var success := false
			match todo:
				"left":
					success = pf.go_left()
				"right":
					success = pf.go_right()
				"up":
					success = pf.go_up()
				"down":
					success = pf.go_down()
			if success:
				waiting += 1

func _on_just_arrived():
	waiting -= 1