extends Control
class_name SceneDialogue

@export var audio_manager: AudioManager
@export var autoread = false
@export_multiline var puzzle_prompt_text: String
@export_multiline var puzzle_complete_text: String
@export_multiline var easter_egg_text: String
@onready var text_display: RichTextLabel = find_child("Text Display")

var puzzle_prompt_speakers = ""
var puzzle_complete_speakers = ""


var text_read_speed = 13
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
	if phase == 0:
		return
	audio_manager.play_voice_sequence(puzzle_prompt_speakers)
	read_text(puzzle_prompt_text)
	phase = 0
	
func give_complete():
	if phase == 2:
		return
	read_text(puzzle_complete_text)
	audio_manager.play_voice_sequence(puzzle_complete_speakers)
	phase = 2

func give_easter_egg():
	if phase == 4:
		return
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
			
