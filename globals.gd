extends Node

var fadePanelModel = preload("res://UI/FadePanel.tscn")
var fadePanel: AnimationPlayer = null

func getFadePanel():
	if fadePanel == null:
		fadePanel = fadePanelModel.instance()
		get_tree().root.call_deferred("add_child", fadePanel)
	return fadePanel