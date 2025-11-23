extends RigidBody2D

@onready var wall: RayCast2D = $RayCast2D

var size = 0

func Shrink():
	for i in get_children():
		i.transform.x /= 2
		i.transform.y /= 2
	
	size = 1

func Normal():
	for i in get_children():
		i.transform.x *= 2
		i.transform.y *= 2
	
	size = 0
	
