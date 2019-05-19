extends Node2D

var is_down = false


func _on_ClickableArea_clicked():
	MainTitleMusic.changeFxVolume($Clickclick)
	if (!is_down):
		$Up.hide()
		$Down.show()
		is_down = true
	
	else:
		$Up.show()
		$Down.hide()
		is_down = false

	$"/root/globals".displayProperPanel("1")
