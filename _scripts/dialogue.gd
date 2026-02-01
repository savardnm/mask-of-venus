extends Control
class_name SceneDialogue

@export var autoread = false
@export_multiline var puzzle_prompt_text: String
@export_multiline var puzzle_complete_text: String
@export_multiline var easter_egg_text: String
@onready var text_display: RichTextLabel = find_child("Text Display")

var text_read_speed = 12
var read_progress = 0.0

var phase = -1

func _ready():
	# give_prompt()
	pass

func _process(delta: float):
	if text_display.visible_ratio < 1.0:
		read_progress += text_read_speed * delta
		text_display.visible_characters = round(read_progress)
	else:
		text_display.visible_ratio = 1.0

		match phase:
			0:
				prompt_finished.emit()
				phase = 1
			2:
				complete_finished.emit()
				phase = 3
			4:
				easter_egg_finished.emit()
				phase = 5
	

func give_prompt():
	read_text(puzzle_prompt_text)
	phase = 0
	
func give_complete():
	read_text(puzzle_complete_text)
	phase = 2

func give_easter_egg():
	read_text(easter_egg_text)
	phase = 4


func puzzle_complete():
	pass

func read_text(string: String):
	# string = "[color=black]" + string + "[/color]"
	read_progress = 0.0
	text_display.visible_characters = round(read_progress / string.length())
	text_display.text = string


signal prompt_finished
signal complete_finished
signal easter_egg_finished


func _on_node_2d_accept_pressed():
	match phase:
		-1:
			give_prompt()
		1:
			give_complete()
		3:
			give_easter_egg()
			
