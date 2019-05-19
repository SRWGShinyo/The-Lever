extends Node2D

func _ready():
	if !MainTitleMusic.audioLv1.playing:
		MainTitleMusic.audioLv1.play()

func _on_Lever_clicked():
	$Lever.set_scene_to_load("res://scenes/Level2.tscn")