#porta escola saida - escola
extends Area2D

func _ready() -> void:
	monitoring = false
	await get_tree().create_timer(0.2).timeout
	monitoring = true
#

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GameState.local_anterior = GameState.local_atual
		GameState.local_atual = "fora_hospital"
		get_tree().change_scene_to_file.bind("res://cena - cenarios/main.tscn").call_deferred()
