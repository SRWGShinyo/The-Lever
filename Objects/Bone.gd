extends Node2D

func _on_ClickableArea_clicked():
	$"/root/globals".get_player().give_item("bone")
	queue_free()
