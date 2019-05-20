extends KinematicBody2D

class_name Player

var velocity := Vector2()

var last_is_on_floor = false

const MAX_SPEED = 140
const gravity = 10
const JUMP_STRENGTH = 360
const DAMPENING: float = 0.7

onready var inventory = $"/root/globals".inventory

func give_item(name: String) -> void:
	inventory[name] = name

func has_item(name: String) -> bool:
	return inventory.has(name)

func remove_item(name: String) -> void:
	inventory.erase(name)

func _ready():
	pass
	
func dampen(val: float, target: float) -> float:
	return target - (target - val) * DAMPENING

func moving() -> bool:
	return Input.is_action_pressed("PLAYER_RIGHT") != Input.is_action_pressed("PLAYER_LEFT")

func _physics_process(delta):
	if moving():
		if Input.is_action_pressed("PLAYER_RIGHT"):
			velocity.x = dampen(velocity.x, MAX_SPEED)
		if Input.is_action_pressed("PLAYER_LEFT"):
			velocity.x = dampen(velocity.x, -MAX_SPEED)
	else:
		velocity.x = dampen(velocity.x, 0)
	
	velocity.y += gravity
		
	if Input.is_action_pressed("PLAYER_JUMP") and is_on_floor():
		velocity.y = -JUMP_STRENGTH
	
	velocity = move_and_slide(velocity, Vector2(0, -1))

	if not last_is_on_floor and not is_on_floor():
		$AnimatedSprite.play("Jump")
	else:
		if velocity.x > -1 and velocity.x < 1:
			if $AnimatedSprite.animation != "Interact":
				$AnimatedSprite.play("Idle")
		else:
			$AnimatedSprite.play("Walk")
			
	last_is_on_floor = is_on_floor()

	if velocity.x > 0.1:
		$AnimatedSprite.flip_h = false
	elif velocity.x < -0.1:
		$AnimatedSprite.flip_h = true


func _on_Bone_bone_found():
	give_item("bone")


func interact():
	$AnimatedSprite.play("Interact")
