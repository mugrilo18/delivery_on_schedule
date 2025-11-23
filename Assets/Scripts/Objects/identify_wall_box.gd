extends Area2D

@onready var wall: RayCast2D = $"../RayCast2D"

var areaSmall: bool

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Ground"):
		if !wall.is_colliding():
			if areaSmall == false and get_parent().size == 1:
				get_parent().Normal()
	

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("ShrinkArea"):
		areaSmall = true
		

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("ShrinkArea"):
		areaSmall = false
	
