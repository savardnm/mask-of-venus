extends Area2D
class_name Spotlight


# @export var size = 100:
# 	set(value):
# 		size = value
# 		scale = Vector2(size/100, size/100)

@export var size = 100

@export var color = Color(1,1,1,1):
	set(value):
		color = value
		set_spotlight_color(value)

@export var shader: ShaderMaterial

@onready var target_position = global_position
var drag = 0.85
var mass = 1.0
var velocity = Vector2.ZERO

var outline = false:
	set(value):
		outline = value
		queue_redraw()

func set_spotlight_color(new_color: Color):
	var sprite: Sprite2D = find_child("Color Circle")
	print("color circle?: ", sprite, color)
	sprite.material.set_shader_parameter("instance_shader_parameters/objectColor", Vector4(new_color.r, new_color.g, new_color.b, new_color.a))

# Called when the node enters the scene tree for the first time.
func _ready():
	# set_spotlight_color(color)
	pass # Replace with function body.

func draw_outline():
	draw_circle(Vector2.ZERO, size, Color.WHITE, false, 2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	var direction = target_position - global_position
	velocity += direction / mass
	velocity = velocity * drag
	position += velocity * delta
	pass

func _draw():
	if outline:
		draw_outline()
