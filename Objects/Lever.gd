extends Node2D

signal clicked

var scene_to_load: String = ""

func _on_ClickableArea_clicked():
	var clik = $Audio
	var fadePanel: AnimationPlayer = get_node("/root/globals").getFadePanel()
	fadePanel.connect("animation_finished", self, "_animation_finished")
	fadePanel.play("Fade")
	$AnimatedSprite.play("activate")
	$AnimatedSprite.frame = 0
	MainTitleMusic.changeFxVolume(clik)
	emit_signal("clicked")

func _animation_finished(anim_name: String):
	var fadePanel: AnimationPlayer = get_node("/root/globals").getFadePanel()
	if anim_name == "Fade":
		get_tree().change_scene(scene_to_load)
		fadePanel.play("FadeAway")

func set_scene_to_load(scene_name: String):
	scene_to_load = scene_name
