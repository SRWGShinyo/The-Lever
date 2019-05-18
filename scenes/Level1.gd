extends Node2D


func _on_Lever_clicked():
	$Lever.set_scene_to_load("res://scenes/Level2.tscn")