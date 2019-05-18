extends Area2D

signal clicked

func _on_ClickableArea_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		event = event as InputEventMouseButton
		if event.button_index == BUTTON_LEFT and event.is_pressed():
			emit_signal("clicked")

func _on_ClickableArea_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_ClickableArea_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
