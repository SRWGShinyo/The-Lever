extends Node2D




func _on_ClickableArea_clicked():
	$AudioStreamPlayer2D.play()
	$AnimatedSprite.play("drop")
	$AnimatedSprite.set_offset(Vector2(-33, -32))
