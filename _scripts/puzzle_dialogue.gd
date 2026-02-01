extends Node2D
class_name PuzzleDialogue


@export_multiline var puzzle_prompt_text: String
@export_multiline var puzzle_complete_text: String
@export_multiline var easter_egg_text: String

@export var puzzle_prompt_speakers: Array[String]
@export var puzzle_complete_speakers: Array[String]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
