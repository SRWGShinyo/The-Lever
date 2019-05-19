extends Node

var fadePanelModel = preload("res://UI/FadePanel.tscn")
var fadePanel: AnimationPlayer = null

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