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
			spawn_position = Vector2(331, 200)
		_:
			spawn_position = Vector2(621, 454)  # Fallback - nascimento padrão
	
	print("Spawning em: ", spawn_position)
	GameState.spawn_player_at(spawn_position, self)

#func _ready():
	#
	## Verifica se já existe um player na cena
	#if get_tree().get_first_node_in_group("player"):
		#return  # Já tem player, não spawna de novo
	#
	## Tenta encontrar o nó de spawn
	#var spawn_node: Node2D = get_node_or_null(NodePath(GameState.marcador_anterior))
	#
	#if spawn_node:
		#print("Spawn encontrado: ", GameState.marcador_anterior)
		#GameState.spawn_player_at(spawn_node.global_position, self)
	#else:
		#print("Spawn NÃO encontrado: ", GameState.marcador_anterior)
		#fallback_position = Vector2(331, 200)
		#GameState.spawn_player_at(fallback_position, self)
	#

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
