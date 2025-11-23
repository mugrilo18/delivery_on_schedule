extends CharacterBody2D
@onready var wall: RayCast2D = $IdentifyWall2
@onready var camera_2d: Camera2D = $Camera2D

var size = 0

const SPEED = 300.0
var jumpVelocity = -400.0
var pushForce = 85.0


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jumpVelocity

	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider() is RigidBody2D:
			collision.get_collider().apply_central_impulse(collision.get_normal() * -pushForce)
	
	move_and_slide()

func Shrink():
	transform.x /= 2
	transform.y /= 2
	get_child(2).zoom += Vector2(0.5, 0.5)
	jumpVelocity = -400.0 / 1.5
	size = 1

func Grow():
	transform.x *= 2
	transform.y *= 2
	get_child(2).zoom -= Vector2(0.5, 0.5)
	jumpVelocity = -400.0 * 1.5
	size = 2

func GrowSquare():
	transform.x *= 4
	transform.y *= 4
	get_child(2).zoom -= Vector2(1.0, 1.0)
	jumpVelocity = -400.0 * 1.5
	size = 2

func Normal():
	match size:
		1:
			transform.x *= 2
			transform.y *= 2
			get_child(2).zoom -= Vector2(0.5, 0.5)
			jumpVelocity = -400.0
			size = 0
		2:
			transform.x /= 2
			transform.y /= 2
			get_child(2).zoom += Vector2(0.5, 0.5)
			jumpVelocity = -400.0
			size = 0
