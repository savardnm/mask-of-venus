extends Node



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var viewport : Viewport  = get_tree().root 
	print(viewport.get_texture().get_image().get_pixel(778,309) )
	# print(self.name)
	pass

func _physics_process(delta: float) -> void:
	
	pass

	
