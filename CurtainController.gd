extends Node2D

var open = false
var transitioning = false

@onready var animation_player: AnimationPlayer = find_child("AnimationPlayer")

func _process(delta: float):
	if transitioning:
		if not animation_player.is_playing():
			if open:
				curtains_closed.emit()
				transitioning = false
				open = false
			else:
				curtains_opened.emit()
				transitioning = false
				open = true

func close_curtains():
	if open:
		animation_player.play("curtain_pull")
		transitioning = true

func open_curtains():
	if not open:
		animation_player.play("Curtain Push")
		transitioning = true


signal curtains_closed
signal curtains_opened



func _on_node_2d_accept_pressed():
	if not transitioning:
		toggle()

func toggle():
	if open:
		close_curtains()
	else:
		open_curtains()
