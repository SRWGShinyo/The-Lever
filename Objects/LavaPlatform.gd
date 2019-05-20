extends Node2D

var islava = true



func _on_ClickableArea_clicked():
	if islava and get_node("/root/globals").get_player().has_item("seau_eau") :
		get_node("/root/globals").get_player().remove_item("seau_eau")
		islava = false
		$Path2D/PathFollow2D/Lava.hide()
		$Path2D/PathFollow2D/Rock.show()
		$Path2D/PathFollow2D/Rock/KinematicBody2D/CollisionShape2D.set_disabled(false)
		MainTitleMusic.changeFxVolume($pschhh)