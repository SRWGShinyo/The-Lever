extends Node2D

signal bone_found

func _on_ClickableArea_clicked():
	emit_signal("bone_found")
	queue_free()
