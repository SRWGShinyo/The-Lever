extends KinematicBody2D

var old_velocity = Vector2(0, 0)
var velocity = Vector2(0, 0)
const MAX_SPEED = 60
const gravity = 3
const JUMP_STRENGTH = 120

func _ready():
	pass
	
func dampen(val: float, target: float) -> float:
	return target - (target - val) * 0.7

func moving() -> bool:
	return Input.is_action_pressed("PLAYER_RIGHT") != Input.is_action_pressed("PLAYER_LEFT")

func is_grounded() -> bool:
	return old_velocity.y > 0 and velocity.y < old_velocity.y

func _physics_process(delta):
	if moving():
		if Input.is_action_pressed("PLAYER_RIGHT"):
			velocity.x = dampen(velocity.x, MAX_SPEED)
		if Input.is_action_pressed("PLAYER_LEFT"):
			velocity.x = dampen(velocity.x, -MAX_SPEED)
	else:
		velocity.x = dampen(velocity.x, 0)
	
	velocity.y += gravity
	
	old_velocity = velocity
	velocity = move_and_slide(velocity)

func _process(delta):
	if Input.is_action_pressed("PLAYER_JUMP") and is_grounded():
		velocity.y = -JUMP_STRENGTH