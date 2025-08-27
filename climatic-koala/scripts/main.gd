#main
extends Node2D

#@onready var player := get_tree().get_first_node_in_group("player")

var fallback_position = Vector2(0, 0)


func _ready():
	# Remove player existente antes de spawnar novo
	var existing_player = get_tree().get_first_node_in_group("player")
	if existing_player:
		existing_player.queue_free()
	
	# Define spawn point baseado no marcador
	var spawn_position: Vector2
	
	match GameState.local_atual:
		"dentro_escola":
			spawn_position = Vector2(621, 454)
		"fora_escola":
			spawn_position = Vector2(366, 235)
		"dentro_lanchonete":
			spawn_position = Vector2(623, 638)
		"fora_lanchonete":
			spawn_position = Vector2(101, 845)
		"dentro_biblioteca":
			spawn_position = Vector2(279, 589)
		"fora_biblioteca":
			spawn_position = Vector2(926, 215)
		"dentro_mercearia":
			spawn_position = Vector2(146, 900)
		"fora_mercearia":
			spawn_position = Vector2(1271, 940)
		"dentro_hospital":
			spawn_position = Vector2(1019, 546)
		"fora_hospital":
			spawn_position = Vector2(1606, 1090)
			
		"dentro_progresso":
			spawn_position = Vector2(GameState.local_mapa)
		"fora_progresso":
			spawn_position = Vector2(GameState.local_mapa)
			
			
		_:
			spawn_position = Vector2(371, 300)  # Fallback - nascimento padrão
	
	print("Spawning em: ", spawn_position)
	GameState.spawn_player_at(spawn_position, self)


func _process(delta: float) -> void:
	pass
