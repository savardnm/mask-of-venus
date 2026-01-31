extends Node

@onready var viewport : Viewport  

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	viewport = get_tree().root 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(get_current_color())
	# print(self.name)
	pass

func _physics_process(delta: float) -> void:
	
	pass

func get_current_color():
	return viewport.get_texture().get_image().get_pixel(778,309) 
