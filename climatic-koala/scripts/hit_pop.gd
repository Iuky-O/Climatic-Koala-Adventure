extends Area2D

@export var dialog_texts : Array[String] = []
@export var offset_position : Vector2 = Vector2(0, -20)

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		DialogManager.start_dialog(dialog_texts, global_position + offset_position)
