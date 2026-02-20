extends Node2D

@onready var flame: Sprite2D = $Flame

func _ready() -> void:
	# This parameter of the shader material gives each flame a slightly different look and randomized animation.
	flame.material.set("shader_parameter/offset", global_position * 0.1)

func _input_event(viewport: Viewport, event: InputEvent, shape_index:int):
	var event_is_mouse_click: bool = (
		event is InputEventMouseButton and
		event.button_index == MOUSE_BUTTON_LEFT and 
		event.is_pressed()
	)
	
	if event_is_mouse_click:
		if flame.visible:
			off()
		else:
			on()
		
			
func off() -> void:
	var tween := create_tween()	
	tween.set_parallel()
	tween.tween_property(flame, "scale", Vector2(0.0, 0.0), 1.0)
	if tween.finished:	
		flame.visible = false
func on() -> void:
	var tween := create_tween()	
	tween.set_parallel()
	tween.tween_property(flame, "scale", Vector2(0.5, 0.5), 1.0)
	if tween.finished:
		flame.visible = true
