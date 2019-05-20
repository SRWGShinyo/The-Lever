extends Node2D

var target := Vector2.INF
onready var animator: AnimatedSprite = null
var has_bone := false
var hole_sprite: AnimatedSprite = null

const SPEED := 100

var barks = []
var rng = RandomNumberGenerator.new()
var time = Timer.new()

func _playRandomBark():
	var toplay = rng.randi_range(0, len(barks) - 1)
	var audio = barks[toplay]
	audio.play()

func _ready():
	rng.randomize()
	barks.append(MainTitleMusic.bark1)
	barks.append(MainTitleMusic.bark2)
	barks.append(MainTitleMusic.bark3)

func is_at_target() -> bool:
	if target == Vector2.INF:
		return true
	return position.x > target.x - 10 and position.x < target.x + 10

func _on_ClickableArea_clicked():
	animator = $"./Clickable/ClickableArea/AnimatedSprite"
	var player = $"/root/globals".get_player()
	if player != null and player.has_item("bone"):
		player.remove_item("bone")
		hole_sprite = get_node("../Hole")
		target = hole_sprite.position
		has_bone = true
	elif animator.animation == "Idle" and is_at_target():
		_playRandomBark()
		animator.play("Pet")
		$"/root/globals".keep_dog = true
		if player != null:
			animator.flip_h = player.position.x < position.x

func _on_AnimatedSprite_animation_finished():
	animator = $"./Clickable/ClickableArea/AnimatedSprite"
	if animator.animation == "Pet" or (animator.animation == "Walk" and not has_bone):
		animator.play("Idle")
	elif animator.animation == "Dig":
		target.x += 50

func _process(delta):
	if not self.is_at_target():
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
	elif animator != null and animator.animation == "Walk":
		animator.play("Idle")
