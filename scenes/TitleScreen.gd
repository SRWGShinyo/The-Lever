extends Control

var sceneFade = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlayButton_pressed():
	sceneFade = 1

	

func _on_Options_pressed():
	sceneFade = 2

func _on_CreditButton_pressed():
	sceneFade = 3

func _on_LeverRoot_clicked():
	if (sceneFade == 0):
		pass
	
	if (sceneFade == 1):
		MainTitleMusic.audioMain.stop()
		$LeverRoot.set_scene_to_load("res://scenes/Level1.tscn")
	
	if (sceneFade == 2):
		$LeverRoot.set_scene_to_load("res://scenes/Options.tscn")
	
	if (sceneFade == 3):
		$LeverRoot.set_scene_to_load("res://scenes/Credits.tscn")