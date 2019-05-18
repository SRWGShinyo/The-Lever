extends Node2D

signal clicked

var fadePanelModel := preload("res://UI/FadePanel.tscn")
var fadePanel: AnimationPlayer = null

func _on_ClickableArea_clicked():
	if fadePanel == null:
		fadePanel = fadePanelModel.instance()
		get_tree().get_root().add_child(fadePanel)
	fadePanel.play("Fade")
	fadePanel.connect("animation_finished", self, "_animation_finished")
	emit_signal("clicked")

func _animation_finished(anim_name: String):
	if anim_name == "Fade":
		fadePanel.play("FadeAway")
