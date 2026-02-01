extends Node2D

var waiting = true

@export var lady_macbeth: Actor
@export var spot: Actor
@export var background: Actor

func check_if_solved():
	if waiting:
		return false

	if (spot.get_current_color() == lady_macbeth.get_current_color()) and (spot.get_current_color != background.get_current_color):
		print("spot removed!")
		return true

	return false
