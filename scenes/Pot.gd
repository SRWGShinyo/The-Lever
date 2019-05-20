extends Node2D

var isfilled = false

func _on_ClickableArea_clicked():
	if !isfilled && get_node("/root/globals").get_player().has_item("seau_eau"):
		isfilled = true
		get_node("/root/globals").numberPotFilled += 1
		get_node("/root/globals").get_player().remove_item("seau_eau")
		$PotVide.hide()
		$PotPlein.show()
		MainTitleMusic.changeFxVolume($Pour)
