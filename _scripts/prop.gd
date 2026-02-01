extends Node
class_name Actor


@onready var viewport : Viewport  
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	viewport = get_tree().root 
	pass # Replace with function body


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_current_color():
	viewport = get_tree().root 
	return viewport.get_texture().get_image().get_pixel(self.global_position.x,self.global_position.y) 
