extends Area2D
class_name Spotlight


@export var home_position = Vector2.ZERO

var claimed = false
var going_home


# @export var size = 100:
# 	set(value):
# 		size = value
# 		scale = Vector2(size/100, size/100)

@export var size = 100

@export var color = Color(1,1,1,0.5):
	set(value):
		color = value
		set_spotlight_color(value)

@export var shader: ShaderMaterial

@onready var target_position = global_position
var drag = 0.9
var mass = 1.5
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
	go_home()
	# set_spotlight_color(color)
	pass # Replace with function body.

func draw_outline():
	draw_circle(Vector2.ZERO, size, Color.WHITE, false, 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	var direction = target_position - global_position
	velocity += direction / mass
	velocity = velocity * drag
	position += velocity * delta

	if going_home:
		if target_position.distance_to(global_position) < 10:
			going_home = false
		return

	if not claimed:
		if has_overlapping_areas():
			var initial = true
			for candidate in get_overlapping_areas():
				if candidate is MagnetZone:
					if initial:
						target_position = candidate.global_position
						initial = false
					elif candidate.global_position.distance_to(global_position) < target_position.distance_to(global_position):
						target_position = candidate.global_position
			

	pass

func go_home():
	target_position = home_position
	going_home = true

func _draw():
	if outline:
		draw_outline()


func _on_curtain_curtains_closed() -> void:
	pass # Replace with function body.
