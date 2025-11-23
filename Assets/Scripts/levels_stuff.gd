extends Node2D

@onready var mailNode: Node = $Mail
@onready var uiNode: CanvasLayer = $UI
@onready var player: CharacterBody2D = $Player

@onready var maxMail = mailNode.get_child_count()
@onready var letters = 0

func _process(_delta: float) -> void:
	uiNode.lettersQty.text = str(letters) + "/" + str(maxMail)
	PlayerDead()

func PlayerDead():
	if player.global_position.y >= player.get_child(2).limit_bottom:
		get_tree().call_deferred("reload_current_scene")
