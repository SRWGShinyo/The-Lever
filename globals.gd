extends Node

var inventory := {}

var fadePanelModel = preload("res://UI/FadePanel.tscn")
var fadePanel: AnimationPlayer = null

var displayBlue = false
var displayGreen = false
var displayRed = false

var commandPickUp = false

var keep_dog := false
var keep_paint := false
var keep_food := false

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