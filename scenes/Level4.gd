extends Node2D

func _ready():
	if not $"/root/globals".keep_dog:
		$Dog.queue_free()

func _on_Lever_clicked():
	if not $"../Level1Root/Platform2/Path2D".attached:
		$Lever.set_scene_to_load("res://scenes/Level5.tscn")
