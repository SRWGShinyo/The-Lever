extends Path2D

const SPEED := 250

func _physics_process(delta):
	if Input.is_action_pressed("PLAYER_LEFT"):
		$"../BreakerBar/PathFolow2D".offset +=SPEED