#porta escola entrada - vila
extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.set_physics_process(false)

		await get_tree().create_timer(0.2).timeout

		GameState.local_anterior = GameState.local_atual
		GameState.local_atual = "fora_casa"
		GameState.cena_atual = "res://cena - cenarios/cidade.tscn"
		get_tree().change_scene_to_file("res://cena - cenarios/cidade.tscn")
