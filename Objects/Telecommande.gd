extends Node2D

func _on_ClickableArea_clicked():
	MainTitleMusic.changeFxVolume($Pick)
	globals.commandPickUp = true
	queue_free()