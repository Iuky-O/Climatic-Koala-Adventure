extends Control

@onready var dialogo = $MarginContainer/texto/Label

var text_lines = [
	"As mudanças climaticas avançam mais rapido do que nunca...",
	"O planeta ja mostra sinais de caos e desequilibrio.",
	"Você parte rumo a uma vila nas montanhas, ultimo refugio seguro.",
	"La, encontrara' abrigo...",
	"e a chance de transformar o destino do mundo!"
]

var velocidade = 0.05

func iniciar_dialogo():
	visible = true
	await get_tree().process_frame
	_start_dialogue()

func _start_dialogue() -> void:
	for fala in text_lines:
		await _mostrar_dialogo(fala)
	
	GameState.local_anterior = GameState.local_atual
	GameState.local_atual = "fora_escola"
	GameState.cena_atual = "PackedScene#-9223371813063490274" #isso é a main
	get_tree().change_scene_to_file("res://cena - cenarios/main.tscn")

func _mostrar_dialogo(texto: String) -> void:
	dialogo.text = texto
	dialogo.visible_characters = 0
	
	for i in range(texto.length() + 1):
		dialogo.visible_characters = i
		await get_tree().create_timer(velocidade).timeout
	
	await get_tree().create_timer(1.0).timeout
