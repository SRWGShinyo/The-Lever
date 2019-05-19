extends AnimatedSprite

var hole_dug := false
var seeded := false

func _on_Hole_animation_finished():
	hole_dug = true


func _on_ClickableArea_clicked():
	if not hole_dug:
		return
	var player = $"/root/globals".get_player()
	if not player.has_item("seed"):
		return
	player.remove_item("seed")
	seeded = true
	frame = 0
	stop()
	
