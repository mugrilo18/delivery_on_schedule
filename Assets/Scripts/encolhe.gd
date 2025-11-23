extends Area2D

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Transform") and area.get_parent().size == 0:
		area.get_parent().Shrink()
	
	if area.is_in_group("ShrinkBox") and area.get_parent().size == 0:
		area.get_parent().Shrink()

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("Transform") and !area.get_parent().wall.is_colliding():
		area.get_parent().Normal()

	if area.is_in_group("ShrinkBox") and !area.get_parent().wall.is_colliding():
		area.get_parent().Normal()
