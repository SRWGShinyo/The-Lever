extends Node2D



func _on_ClickableArea_clicked():
	$AnimatedSprite.play("explode")
	MainTitleMusic.changeFxVolume($AudioStreamPlayer)


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.get_animation() == "explode":
		$AnimatedSprite.play("default")
