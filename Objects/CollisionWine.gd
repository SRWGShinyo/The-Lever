extends Node2D

func grow():
	MainTitleMusic.changeFxVolume($Grow)
	$Earth.hide()
	$StaticBody2D.show()
	$StaticBody2D/CollisionShape2D.set_disabled(false)
	
func burn():
	MainTitleMusic.changeFxVolume($Burn)
	$Earth.show()
	$StaticBody2D.hide()
	$StaticBody2D/CollisionShape2D.set_disabled(true)

func _on_ClickableArea_clicked():
	if get_node("/root/globals").get_player().has_item("seau_lave"):
		get_node("/root/globals").get_player().remove_item("seau_lave")
		burn()
	if get_node("/root/globals").get_player().has_item("seau_eau"):
		get_node("/root/globals").get_player().remove_item("seau_eau")
		grow()
	
