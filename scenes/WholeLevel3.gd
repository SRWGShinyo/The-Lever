extends Node2D

func _on_LeverRoot_clicked():
	if get_node("/root/globals").numberPotFilled == 3:
		$LeverRoot.set_scene_to_load("res://scenes/2-4.tscn")
