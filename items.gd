extends Area2D

func pop() -> void:
	if animation_player.assigned_animation == ("pop"):
		return
	input_pickable = true
	animation_player.play("pop")
	if possible_items.is_empty():
		queue_free()


func _input_event(viewport: Viewport, event: InputEvent, shape_index:int):
	var event_is_mouse_click: bool = (
		event is InputEventMouseButton and
		event.button_index == MOUSE_BUTTON_LEFT and 
		event.is_pressed()
	)
	
	if event_is_mouse_click:
		pop() 
		pass
