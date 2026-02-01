extends Area2D
class_name Selector

var mouse_position = Vector2.ZERO
var selected_spotlight
var offset = Vector2.ZERO

signal spotlight_selected

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	position = mouse_position
	
	if  has_overlapping_areas():
		if not Input.is_action_pressed("select"):
			if not selected_spotlight == null:
				deselect(selected_spotlight)
			var candidate = get_overlapping_areas()[0]
			if candidate is Spotlight:
				select(candidate)
	else:
		if not selected_spotlight == null and not Input.is_action_pressed("select"):
			deselect(selected_spotlight)

	if selected_spotlight == null:
		return

	if Input.is_action_just_pressed("select"):
		offset = selected_spotlight.global_position - global_position
		spotlight_selected.emit()

	selected_spotlight.claimed = false
	if Input.is_action_pressed("select"):
		selected_spotlight.target_position = global_position + offset
		selected_spotlight.claimed = true



func _input(event: InputEvent):
	if event is InputEventMouse:
		mouse_position = event.global_position
		

func select(area: Area2D):
	selected_spotlight = area
	area.outline = true

func deselect(area: Area2D):
	area.outline = false
	selected_spotlight = null
