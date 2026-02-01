extends Node2D

func _process(delta: float):
	if Input.is_action_just_pressed("ui_accept"):
		accept_pressed.emit()

signal accept_pressed