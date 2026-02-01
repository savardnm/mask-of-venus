extends Node

@export var bear : Node #hide to save the rescue object
@export var rescueObject : Node # or hide to prtoect
@export var background : Node # the element to match to hide the rescue obj or hide the bear

@export var alternateSolution : bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func check_if_solved():
	# if the needed objects are missing return to move to the next puzzle
	if bear == null or rescueObject == null or background == null:
		return true
	
	if bear.get_current_color() == background.get_current_color():
		return true
	if rescueObject.get_current_color() == background.get_current_color():
		return true

	return false

