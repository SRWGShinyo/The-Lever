extends Node2D

func _ready():
	if not $"/root/globals".keep_dog:
		$Dog.queue_free()

func _on_Lever_clicked():
	if $Plant.watered:
		$Lever.set_scene_to_load("res://scenes/Level4.tscn")
