extends Node2D

func grow():
	MainTitleMusic.changeFxVolume($Grow)
	$Earth.hide()
	$StaticBody2D.set_process(true)
	$StaticBody2D.show()
	
func burn():
	MainTitleMusic.changeFxVolume($Burn)
	$Earth.show()
	$StaticBody2D.set_process(false)
	$StaticBody2D.hide()