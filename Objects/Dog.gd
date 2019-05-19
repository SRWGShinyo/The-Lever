extends Node2D


func _on_ClickableArea_clicked():
	if $ClickableArea/AnimatedSprite.animation == "Idle":
		$ClickableArea/AnimatedSprite.play("Pet")
		var player := get_tree().get_nodes_in_group("Player")[0] as KinematicBody2D
		$ClickableArea/AnimatedSprite.flip_h = player.position.x < position.x

func _on_AnimatedSprite_animation_finished():
	if $ClickableArea/AnimatedSprite.animation == "Pet":
		$ClickableArea/AnimatedSprite.play("Idle")
