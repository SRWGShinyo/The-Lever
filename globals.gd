extends Node

var inventory := {}

var isCannonFired = false;

var fadePanelModel = preload("res://UI/FadePanel.tscn")
var fadePanel: AnimationPlayer = null

var displayBlue = false
var displayGreen = false
var displayRed = false

var numberPotFilled = 0
var commandPickUp = true

var easymode = true

var keep_dog := false
var keep_paint := false
var keep_food := false

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_H:
			easymode = !easymode

func displayProperPanel(lvl):
	if lvl == "1":
		displayBlue = true
	
	if lvl == "2":
		displayGreen = true
	
	if lvl == "3":
		displayRed = true

func getFadePanel():
	if fadePanel == null:
		fadePanel = fadePanelModel.instance()
		get_tree().root.call_deferred("add_child", fadePanel)
	return fadePanel
	

func get_player():
	var players = get_tree().get_nodes_in_group("Player")
	if players.size() == 0:
		return null
	return players[0]