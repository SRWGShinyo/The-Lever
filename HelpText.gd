extends Node2D

func _process(delta):
	if ($"/root/globals".easymode):
		show()
	else:
		hide()