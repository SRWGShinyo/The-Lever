extends Node2D

var isfilled = false

export var item_neded := "seau_eau"

func _on_ClickableArea_clicked():
	if !isfilled && get_node("/root/globals").get_player().has_item(item_neded):
		isfilled = true
		get_node("/root/globals").numberPotFilled += 1
		get_node("/root/globals").get_player().remove_item(item_neded)
		$PotVide.hide()
		$PotPlein.show()
		MainTitleMusic.changeFxVolume($Pour)
