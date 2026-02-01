extends Node

@export var loaderName : String;
@export var loader : Node
@export var dialogue : Node
@export var debugText : RichTextLabel
@export var activePuzzle : Node
var currentLevel = 0
var puzzleSolved = false
var timer = 0

signal puzzle_solved

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# loader = get_tree().root.get_node(loaderName);
	if loader:
		print("has loader")
		activePuzzle = loader.load_puzzle(0);
	pass # Replace with function body.

func pause_active_puzzle():
	activePuzzle.waiting = true
func resume_active_puzzle():
	activePuzzle.waiting = false

func get_next_puzzle():

	puzzleSolved = false
	currentLevel = currentLevel + 1
	#  delete the previous puzzle
	activePuzzle.queue_free()

	activePuzzle = loader.load_puzzle(currentLevel);

	if activePuzzle == null:
		currentLevel = 0
		activePuzzle = loader.load_puzzle(currentLevel);

	
	pause_active_puzzle()
	print("pausing active puzzle: ", activePuzzle)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if puzzleSolved == true:
		if Input.is_action_just_pressed("ui_accept") and activePuzzle:
			puzzle_solved.emit()
		return
	timer = timer + delta
	# we dont need to check every frame
	if timer > 0.2:
		timer = 0

		# if Input.is_action_just_pressed("ui_accept") and activePuzzle:
		if debugText:
			debugText.text = str(activePuzzle.check_if_solved())
		if activePuzzle.check_if_solved():
			puzzleSolved = true
			

	pass


func _on_curtain_2_curtains_closed():
	get_next_puzzle()
