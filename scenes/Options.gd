extends Control




func _on_LeverRoot_clicked():
	$LeverRoot/AnimatedSprite.play("activate")
	$LeverRoot.set_scene_to_load("res://scenes/TitleScreen.tscn")
