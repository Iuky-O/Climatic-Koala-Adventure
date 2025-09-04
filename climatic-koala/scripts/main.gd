extends Node2D

var fallback_position = Vector2(0, 0)
var cena_bonita = preload("res://cena - cenarios/vila.tscn")
var cena_feia = preload("res://cena - cenarios/vila_doente.tscn")
var cena_escolhida: PackedScene

var instancia: Node = null

func set_world():
	var progresso = Dados.progresso_atual

	# escolhe cena bonita ou feia
	if progresso >= 100:
		cena_escolhida = cena_bonita
	else:
		cena_escolhida = cena_feia

	# instancia e adiciona à Main
	instancia = cena_escolhida.instantiate()
	add_child(instancia)
	move_child(instancia, 0)
	
func set_local_map():
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
		"dentro_progresso", "fora_progresso":
			get_tree().call_deferred("change_scene_to_file", GameState.cena_atual)
			spawn_position = GameState.local_mapa
		_:
			spawn_position = Vector2(371, 300)  # Fallback - nascimento padrão
			get_tree().change_scene_to_file("res://cena - cenarios/main.tscn")
	
	print("Spawning em: ", spawn_position)
	GameState.spawn_player_at(spawn_position, self)
	
func get_girl():
	print("Main carregada, local_atual =", GameState.local_atual)

	GameState.clear_player_reference()
	
	var existing_players = get_tree().get_nodes_in_group("player")
	for existing_player in existing_players:
		existing_player.queue_free()
	
func _ready():
	
	set_world()
	
	get_girl()
		
	set_local_map()

func _process(delta: float) -> void:
	pass
