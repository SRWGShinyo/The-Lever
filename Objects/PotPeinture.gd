extends Node2D




func _on_ClickableArea_clicked():
	MainTitleMusic.changeFxVolume($AudioStreamPlayer)
	$AnimatedSprite.play("drop")
	$AnimatedSprite.set_offset(Vector2(-33, -32))
