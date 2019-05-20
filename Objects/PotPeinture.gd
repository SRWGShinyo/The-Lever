extends Node2D


func put_down(force_instant = false):
	$"../PotPeinture/ClickableRoot".hide()
	if force_instant:
		$AnimatedSprite.play("dropped")
		

func _on_ClickableArea_clicked():
	MainTitleMusic.changeFxVolume($AudioStreamPlayer)
	$AnimatedSprite.play("drop")
	$AnimatedSprite.set_offset(Vector2(-33, -32))
	put_down()
	$"/root/globals".keep_paint = true
