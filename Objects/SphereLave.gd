extends Node2D

var islava = true



func _on_ClickableArea_clicked():
	if islava and get_node("/root/globals").get_player().has_item("seau_lave") :
		get_node("/root/globals").get_player().remove_item("seau_lave")
		islava = false
		$Lava.hide()
		$Rock.show()
		MainTitleMusic.changeFxVolume($pschhh)
	
	elif !islava:
		get_node("/root/globals").get_player().give_item("boulet")
		queue_free()
