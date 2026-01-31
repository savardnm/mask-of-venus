extends Control
class_name SceneDialogue


@export_multiline var puzzle_prompt_text: String
@export_multiline var puzzle_complete_text: String
@onready var text_display: RichTextLabel = find_child("Text Display")

var text_read_speed = 10
var read_progress = 0.0

func _ready():
	text_display.text = "[color=black]" + "BBBBBBBBBBBB" + "[/color]"
	give_prompt()
	pass

func _process(delta: float):
	if text_display.visible_ratio < 1.0:
		read_progress += text_read_speed * delta
		text_display.visible_characters = round(read_progress)
	else:
		text_display.visible_ratio = 1.0
	

func give_prompt():
	read_text(puzzle_prompt_text)
	pass

func puzzle_complete():
	pass

func read_text(string: String):
	string = "[color=black]" + string + "[/color]"
	read_progress = 0.0
	text_display.visible_characters = round(read_progress / string.length())
	text_display.text = string
