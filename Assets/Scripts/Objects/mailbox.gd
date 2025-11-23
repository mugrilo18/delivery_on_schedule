extends Area2D

@export_file("*tscn") var nextStage:String


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and body.get_parent().letters == body.get_parent().maxMail:
		call_deferred("ChangeLevel")
	

func ChangeLevel():
	if ResourceLoader.exists(nextStage):
		get_tree().change_scene_to_file(nextStage)
