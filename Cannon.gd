extends Node2D



func _on_ClickableArea_clicked():
	if $"/root/globals".get_player().has_item("boulet"):
		$"/root/globals".get_player().remove_item("boulet")
		$AnimatedSprite.play("BOOM")



func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.get_animation() == "BOOM":
		$"/root/globals".isCannonFired = true
		$AnimatedSprite.play("default")
		MainTitleMusic.changeFxVolume($AudioStreamPlayer)
