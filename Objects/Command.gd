extends Node2D

var isvisible = false;

func _enter_tree():
	$Tableau.set_process(false)
	$Tableau.hide()
	

func set_visible(v: bool):
	if not v:
		$Tableau.hide()
		isvisible = false
	else:
		$Tableau.show()
		isvisible = true
		$Tableau.move_queue.clear()

func switch_visible():
	set_visible(not isvisible)

func _on_ClickableCommandArea_clicked():
	MainTitleMusic.changeFxVolume($BipBoup)
	switch_visible()
