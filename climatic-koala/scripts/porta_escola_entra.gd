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
		GameState.local_anterior = GameState.local_atual
		GameState.local_atual = "dentro_escola"
		GameState.cena_atual = "res://cena - cenarios/escola.tscn"
		get_tree().call_deferred("change_scene_to_file", "res://cena - cenarios/escola.tscn")
