extends Control




func _on_LeverRoot_clicked():
	$LeverRoot.set_scene_to_load("res://scenes/TitleScreen.tscn")


func _on_HSlider_value_changed(value):
	var musicDisp = get_node("Music/DisplayVolume")
	musicDisp.text = str(value) + "%"
	
	MainTitleMusic.musiclvl = value
	MainTitleMusic.changeMusicVolume()


func _on_FXSlider_value_changed(value):
	var fxDisp = get_node("FX/DisplayFX")
	fxDisp.text = str(value) + "%"
	
	MainTitleMusic.fxlvl = value
	MainTitleMusic.changeFxVolume()
