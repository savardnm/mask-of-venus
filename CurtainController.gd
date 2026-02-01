extends Node2D

var open = false
var transitioning = false

@onready var animation_player: AnimationPlayer = find_child("AnimationPlayer")


signal curtains_closed
signal curtains_opened
signal curtains_closing
signal curtains_opening


func _ready():
	print("anim: ", animation_player)

func _process(delta: float):
	if transitioning:
		if not animation_player.is_playing():
			print("done animating!", name)
			if open:
				curtains_closed.emit()
				transitioning = false
				open = false
			else:
				curtains_opened.emit()
				transitioning = false
				open = true

func close_curtains():
	print("open?")
	# if open:
	print("closing.")
	curtains_closing.emit()
	animation_player.play("curtain_pull")
	transitioning = true

func open_curtains():
	print("closed?")
	# if not open:
	print("opening")
	curtains_opening.emit()
	animation_player.play("Curtain Push")
	transitioning = true



func _on_node_2d_accept_pressed():
	if not transitioning:
		toggle()

func toggle():
	if open:
		close_curtains()
	else:
		open_curtains()

