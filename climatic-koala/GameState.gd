#gamestate
extends Node

var local_atual = "fora_escola"
var local_anterior = ""

var menina : CharacterBody2D = null

var local_mapa: Vector2
var cena_atual = preload("res://cena - cenarios/main.tscn")

var player_scene = preload("res://cena - personagens/menina.tscn")
var player : Node = null

func spawn_player_at(position: Vector2, parent: Node):
	if player == null:
		player = player_scene.instantiate()
		player.add_to_group("player")
		parent.add_child(player)
	player.global_position = position


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
