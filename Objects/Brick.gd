extends Node2D

var state = 0
onready var player : AnimatedSprite = get_node("AnimatedSprite")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	onHit()

func onHit():
	if state == 0:
		player.play("hit")
		state += 1

	else:
		player.play("destruct")


func _on_AnimatedSprite_animation_finished():
	if player.get_animation() == "hit":
		player.play("bris")
	
	elif player.get_animation() == "destruct":
		self.queue_free()
