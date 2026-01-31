extends Node

@export var loaderName : String;
@export var loader : Node
@export var debugText : RichTextLabel
@export var activePuzzle : Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("start")
	# loader = get_tree().root.get_node(loaderName);
	if loader:
		print("has loader")
		activePuzzle = loader.load_puzzle(0);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") and activePuzzle:
		if debugText:
			debugText.text = str(activePuzzle.check_if_solved())
	pass
