extends Node

var local_atual = "fora_escola"
var local_anterior = ""

var menina : CharacterBody2D = null
var local_mapa: Vector2

var cena_main = preload("res://cena - cenarios/main.tscn")
var cena_atual = cena_main

var player_scene = preload("res://cena - personagens/menina.tscn")
var player : Node = null

func spawn_player_at(position: Vector2, parent: Node):
	# Remove o player antigo se existir
	if player != null:
		if is_instance_valid(player):
			player.queue_free()
		player = null
	
	# Cria novo player
	player = player_scene.instantiate()
	player.add_to_group("player")
	parent.add_child(player)
	player.global_position = position
	print("Player spawnado em: ", position)

# Função para limpar a referência do player manualmente
func clear_player_reference():
	if player != null:
		if not is_instance_valid(player):
			player = null
		else:
			print("Aviso: Tentativa de limpar referência de player ainda válido")
