extends Node

@export var puzzleList: Array[PackedScene] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func load_next_puzzle():
	

func load_puzzle(puzzle_number:int):
	var _puzzle = puzzleList[puzzle_number]
	# Check if Sprite A is assigned before trying to spawn
	if _puzzle:
		var spawned_puzzle = _puzzle.instantiate()
		add_child(spawned_puzzle)
		spawned_puzzle.position = Vector2(0, 0) # Set a starting position
		print("Spawned puzzle")
		return spawned_puzzle
