extends KinematicBody2D

var velocity = Vector2(0, 0)
const MAX_SPEED = 60
const gravity = 3

func _ready():
	pass
	
func dampen(val: float, target: float) -> float:
	return target - (target - val) * 0.7

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
	
	velocity = move_and_slide(velocity)