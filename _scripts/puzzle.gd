extends Node

@export var goalObject : Node;
@export var otherObject : Node;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func check_if_solved():
	if goalObject and otherObject:
		return goalObject.get_current_color() == otherObject.get_current_color()
