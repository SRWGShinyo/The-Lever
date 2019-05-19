extends Node2D

func grow():
	MainTitleMusic.changeFxVolume($Grow)
	$Earth.hide()
	$Wine.show()
	
func burn():
	MainTitleMusic.changeFxVolume($Burn)
	$Earth.show()
	$Wine.hide()