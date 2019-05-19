extends Node2D

func _ready():
	hide()

var move_queue := []
var waiting := 0

var moving := false

var connected := false

func _process(delta):
	if not connected:
		for platform in get_tree().get_nodes_in_group("Platform"):
			var pf := platform as Platform
			pf.connect("just_arrived", self, "_on_just_arrived")
		connected = true
	
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
				
	if move_queue.size() == 0:
		moving = false

func _on_just_arrived():
	waiting -= 1

func _on_ClickableLeftArea_clicked():
	MainTitleMusic.changeFxVolume($Click)
	if moving == false:
		move_queue.push_back("left")

func _on_ClickableUpArea_clicked():
	MainTitleMusic.changeFxVolume($Click)
	if moving == false:
		move_queue.push_back("up")

func _on_ClickableRightArea_clicked():
	MainTitleMusic.changeFxVolume($Click)
	if moving == false:
		move_queue.push_back("right")

func _on_ClickableDownArea_clicked():
	MainTitleMusic.changeFxVolume($Click)
	if moving == false:
		move_queue.push_back("down")

func _on_ClickableOKArea_clicked():
	MainTitleMusic.changeFxVolume($Click)
	moving = true