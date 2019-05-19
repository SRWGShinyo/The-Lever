extends Node2D

func _ready():
	if not $"/root/globals".keep_dog:
		$Dog.queue_free()
