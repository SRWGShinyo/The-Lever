extends Node2D

func _on_LeverRoot_clicked():
	if $"/root/globals".isCannonFired:
		MainTitleMusic.audioLv2.stop()
		MainTitleMusic.audioMain.play()
		$LeverRoot.set_scene_to_load("res://scenes/TitleScreen.tscn")
