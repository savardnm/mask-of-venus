extends Node


@export var goalObject: PackedScene



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_sprites()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func spawn_sprites() -> void:
	# Check if Sprite A is assigned before trying to spawn
	if goalObject:
		var spawned_goalObject = goalObject.instantiate()
		add_child(spawned_goalObject)
		spawned_goalObject.position = Vector2(100, 200) # Set a starting position
		print("Spawned Sprite A")
