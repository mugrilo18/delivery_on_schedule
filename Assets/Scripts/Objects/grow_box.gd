extends RigidBody2D

var size = 0

func Grow():
	for i in get_children():
		i.transform.x *= 2
		i.transform.y *= 2
		
	size = 2

func Normal():
	for i in get_children():
		i.transform.x /= 2
		i.transform.y /= 2
		
	size = 0
