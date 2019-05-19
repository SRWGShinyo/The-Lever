extends Control

var sceneFade = 0
var cableList = [];

# Called when the node enters the scene tree for the first time.
func _ready():
	cableList.append($PlayButton/CanvasLayer/cable)
	cableList.append($Options/cable1)
	cableList.append($Options/cable2)
	cableList.append($CreditButton/cable1)
	cableList.append($CreditButton/cable2)
	cableList.append($CanvasLayer/CommandButton/CanvasLayer/cable)
	
	deactivateCables()
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

func _on_CommandButton_pressed():
	sceneFade = 4

func _on_LeverRoot_clicked():
	if (sceneFade == 0):
		pass
	
	if (sceneFade == 1):
		MainTitleMusic.audioMain.stop()
		$CanvasLayer/LeverRoot.set_scene_to_load("res://scenes/Level1.tscn")
	
	if (sceneFade == 2):
		$CanvasLayer/LeverRoot.set_scene_to_load("res://scenes/Options.tscn")
	
	if (sceneFade == 3):
		$CanvasLayer/LeverRoot.set_scene_to_load("res://scenes/Credits.tscn")
		
	if (sceneFade == 4):
		$CanvasLayer/LeverRoot.set_scene_to_load("res://scenes/Commands.tscn")

func activateCable(var elem : Node):
	elem.show()

func deactivateCables():
	for elem in cableList:
		elem.hide()

func _on_PlayButton_button_down():
	deactivateCables()
	activateCable($PlayButton/CanvasLayer/cable)


func _on_Options_button_down():
	deactivateCables()
	activateCable($Options/cable1)
	activateCable($Options/cable2)
	pass # Replace with function body.


func _on_CreditButton_button_down():
	deactivateCables()
	activateCable($CreditButton/cable1)
	activateCable($CreditButton/cable2)


func _on_CommandButton_button_down():
	deactivateCables()
	activateCable($CanvasLayer/CommandButton/CanvasLayer/cable)
