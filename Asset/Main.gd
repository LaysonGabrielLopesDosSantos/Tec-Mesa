extends Node

func _kjp(key: String):
	if Input.is_action_just_pressed(key):
		return true
	else:
		return false
