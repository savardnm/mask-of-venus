extends Node

signal puzzle_spawned

@export var puzzleList: Array[PackedScene] = []
@export var dialogue: Node


func load_puzzle(puzzle_number:int):
	print("loading puzzle #", puzzle_number)
	var _puzzle = puzzleList[puzzle_number % puzzleList.size()]
	# Check if Sprite A is assigned before trying to spawn
	if _puzzle:
		print("puzzle being spawned")
		var spawned_puzzle = _puzzle.instantiate()
		add_child(spawned_puzzle)
		print("puzzle added to tree")
		spawned_puzzle.position = Vector2(0, 0) # Set a starting position
		var puzzle_dialogue = spawned_puzzle.find_child("PuzzleDialogue")
		print("found new dialogue, and going to copy it", puzzle_dialogue.get_parent().name)
		transfer_dialogue(puzzle_dialogue, dialogue)
		print("Spawned puzzle: ", spawned_puzzle.name)
		puzzle_spawned.emit()
		return spawned_puzzle

func transfer_dialogue(puzzle_dialogue: PuzzleDialogue, scene_dialogue: SceneDialogue):
	print("copying dialogue to new scene")
	scene_dialogue.puzzle_prompt_text = puzzle_dialogue.puzzle_prompt_text
	scene_dialogue.puzzle_complete_text = puzzle_dialogue.puzzle_complete_text
	scene_dialogue.easter_egg_text = puzzle_dialogue.easter_egg_text
