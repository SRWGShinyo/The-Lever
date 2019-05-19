extends Area2D

signal clicked

export var distance_check = true
export var radius_check = 100

func can_click(event: InputEventMouseButton) -> bool:
	if not distance_check:
		return true
	var player := get_tree().get_nodes_in_group("Player")
	if player.size() == 0:
		return true
	return ((player[0] as KinematicBody2D).position - event.position).length() < 50

func _on_ClickableArea_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		event = event as InputEventMouseButton
		if not can_click(event):
			return
		if event.button_index == BUTTON_LEFT and event.is_pressed():
			emit_signal("clicked")

func _on_ClickableArea_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_ClickableArea_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
