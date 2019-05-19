extends Node2D

func _ready():
	pass


func _on_ClickableArea_clicked():
	$"/root/globals".get_player().give_item("seed")
	queue_free()
