extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	GameState.local_anterior = GameState.local_atual
	GameState.local_atual = "fora_progresso"
	get_tree().change_scene_to_file.bind("res://cena - cenarios/main.tscn").call_deferred()
