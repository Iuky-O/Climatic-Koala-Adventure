extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GameState.local_anterior = GameState.local_atual
		GameState.local_atual = "fora_lanchonete"
		GameState.cena_atual = "res://cena - cenarios/main.tscn"
		get_tree().change_scene_to_file.bind("res://cena - cenarios/main.tscn").call_deferred()
