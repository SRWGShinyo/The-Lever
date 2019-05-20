extends Path2D

signal death

const SPEED := 350

func _physics_process(delta):
	if Input.is_action_pressed("PLAYER_LEFT"):
		$"../BreakerBar/PathFollow2D".offset -= SPEED * delta
	elif Input.is_action_pressed("PLAYER_RIGHT"):
		$"../BreakerBar/PathFollow2D".offset += SPEED * delta
	if $"../BreakerBar/PathFollow2D".unit_offset < 0:
		$"../BreakerBar/PathFollow2D".unit_offset = 0
	if $"../BreakerBar/PathFollow2D".unit_offset > 1:
		$"../BreakerBar/PathFollow2D".unit_offset = 1

func on_ball_death():
	pass