extends Node2D



func _on_LeverRoot_clicked():
	if get_node("/root/globals").get_player().has_item("seau"):
		$LeverRoot.set_scene_to_load("res://scenes/2.2.tscn")
