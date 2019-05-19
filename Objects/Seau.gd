extends Node2D



func _on_ClickableArea_clicked():
	get_node("/root/globals").get_player().give_item("seau")
	queue_free()
