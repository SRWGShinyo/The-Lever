extends Node2D

func _on_LeverRoot_clicked():
	if get_node("/root/globals").numberPotFilled == 3:
		MainTitleMusic.audioLv1.stop()
		MainTitleMusic.audioMain.play()
		$LeverRoot.set_scene_to_load("res://scenes/TitleScreen.tscn")
