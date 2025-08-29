extends Button

func _ready() -> void:
	connect("pressed", Callable(self, "_on_pressed"))

func _on_pressed() -> void:
	GameState.local_anterior = GameState.local_atual
	GameState.local_atual = "dentro_progresso"
	get_tree().change_scene_to_file.bind("res://cena - cenarios/perguntas.tscn").call_deferred()
