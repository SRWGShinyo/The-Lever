extends Node2D

var watered := false

func _on_plant_clicked():
	var player = $"/root/globals".get_player()
	if player.has_item("water_bucket"):
		player.remove_item("water_bucket")
		watered = true
