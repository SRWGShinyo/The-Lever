extends Node2D

var isvisible = false;

func _enter_tree():
	$Tableau.set_process(false)
	$Tableau.hide()
	



func _on_ClickableCommandArea_clicked():
	MainTitleMusic.changeFxVolume($BipBoup)
	if (isvisible):
		$Tableau.set_process(false)
		$Tableau.hide()
		isvisible = false
	
	else:
		$Tableau.set_process(true)
		$Tableau.show()
		isvisible = true
