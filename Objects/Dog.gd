extends Node2D

var target := Vector2.INF
onready var animator := $Clickable/ClickableArea/AnimatedSprite
var has_bone := false
var hole_sprite: AnimatedSprite = null

const SPEED := 100

func is_at_target() -> bool:
	if target == Vector2.INF:
		return true
	return position.x > target.x - 10 and position.x < target.x + 10

func _on_ClickableArea_clicked():
	var player: Player = $"/root/globals".get_player()
	if player != null and player.has_item("bone"):
		player.remove_item("bone")
		hole_sprite = get_node("../Hole")
		target = hole_sprite.position
		has_bone = true
	elif animator.animation == "Idle" and is_at_target():
		animator.play("Pet")
		if player != null:
			animator.flip_h = player.position.x < position.x

func _on_AnimatedSprite_animation_finished():
	if animator.animation == "Pet" or animator.animation == "Dig":
		animator.play("Idle")

func _process(delta):
	if not is_at_target():
		animator.play("Walk")
		if target.x < position.x:
			position += Vector2(-SPEED * delta, 0)
			animator.flip_h = true
		else:
			position += Vector2(SPEED * delta, 0)
			animator.flip_h = false
	elif has_bone: # just arrived
		animator.play("Dig")
		has_bone = false
		hole_sprite.play("Dig")