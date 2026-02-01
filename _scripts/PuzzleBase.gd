extends Node2D


var waiting = true

@export var active_spotlights = [0,1,2]

var spotlights: Array[Spotlight]

# func gather_spotlights():
# 	for 