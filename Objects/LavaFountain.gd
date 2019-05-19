extends Node2D

func _on_ClickableArea_clicked():
	if get_node("/root/globals").get_player().has_item("seau"):
		MainTitleMusic.changeFxVolume($Fill)
		if get_node("/root/globals").get_player().has_item("seau_eau"):
			get_node("/root/globals").get_player().remove_item("seau_eau")
		if get_node("/root/globals").get_player().has_item("seau_lave"):
			pass
		get_node("/root/globals").get_player().give_item("seau_lave")
