extends Node2D

var waiting = true

@export var brutus: Actor

func check_if_solved():
	if waiting:
		return false

	if brutus.get_current_color() == Color.CYAN:
		print("Brutus!!")
		return true

	return false
