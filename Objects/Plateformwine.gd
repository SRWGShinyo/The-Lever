extends Node2D

func grow():
	MainTitleMusic.changeFxVolume($Grow)
	$Earth.hide()
	if has_node("LeafPlatform"):
		get_node("LeafPlatform").show()
	$Wine.show()
	
func burn():
	MainTitleMusic.changeFxVolume($Burn)
	$Earth.show()
	if has_node("LeafPlatform"):
		get_node("LeafPlatform").show()
	$Wine.hide()

func _on_ClickableArea_clicked():
	if get_node("/root/globals").get_player().has_item("seau_eau"):
		get_node("/root/globals").get_player().remove_item("seau_eau")
		grow()
		
	if get_node("/root/globals").get_player().has_item("seau_lave"):
		get_node("/root/globals").get_player().remove_item("seau_lave")
		burn()
