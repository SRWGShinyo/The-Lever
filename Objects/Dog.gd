extends Node2D

func _on_ClickableArea_clicked():
	if $Clickable/ClickableArea/AnimatedSprite.animation == "Idle":
		$Clickable/ClickableArea/AnimatedSprite.play("Pet")
		var players = get_tree().get_nodes_in_group("Player")
		if players.size() == 0:
			return
		var player := players[0] as KinematicBody2D
		$Clickable/ClickableArea/AnimatedSprite.flip_h = player.position.x < position.x

func _on_AnimatedSprite_animation_finished():
	if $Clickable/ClickableArea/AnimatedSprite.animation == "Pet":
		$Clickable/ClickableArea/AnimatedSprite.play("Idle")
