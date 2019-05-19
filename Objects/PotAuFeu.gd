extends Node2D

func _on_ClickableArea_clicked():
	MainTitleMusic.changeFxVolume($AudioStreamPlayer)
