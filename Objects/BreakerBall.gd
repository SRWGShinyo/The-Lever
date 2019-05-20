extends KinematicBody2D

const SPEED = 200

var velocity := Vector2(-10, -100)

func _physics_process(delta):
	self.move_and_collide(velocity)