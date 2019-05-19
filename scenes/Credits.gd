extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_LeverRoot_clicked():
	$LeverRoot/AnimatedSprite.play("activate")
	$LeverRoot.set_scene_to_load("res://scenes/TitleScreen.tscn")
