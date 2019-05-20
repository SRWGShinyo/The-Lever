extends Node2D

export var nam : String

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

	if (nam == "Blue"):
		$"/root/globals".displayProperPanel("1")
	if (nam == "Green"):
		$"/root/globals".displayProperPanel("2")
	if (nam=="Red"):
		$"/root/globals".displayProperPanel("3")
