extends Button

var pos = rect_position

# warning-ignore:unused_argument
func _process(delta):
	
	if is_hovered():
		var scale = Vector2(1.2, 1.2)
		var posneg = Vector2(2.5, 2.5)
		rect_scale = scale
		rect_position = pos - posneg
	else:
		var scale = Vector2(1, 1)
		rect_scale = scale
		rect_position = pos
