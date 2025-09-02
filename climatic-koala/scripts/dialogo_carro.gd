extends Control

@onready var dialogo = $MarginContainer/texto/RichTextLabel

var text_lines = [
	"As mudanças climáticas avançam mais rápido do que nunca...",
	"O planeta já mostra sinais de caos e desequilíbrio.",
	"Você parte rumo a uma vila nas montanhas, último refúgio seguro.",
	"Lá, encontrará abrigo... e a chance de transformar o destino do mundo!"
]

var velocidade = 0.05

func iniciar_dialogo():
	visible = true
	await get_tree().process_frame
	_start_dialogue()

func _start_dialogue() -> void:
	for fala in text_lines:
		await _mostrar_dialogo(fala)
	
	get_tree().change_scene_to_file("res://cena - cenarios/main.tscn")

func _mostrar_dialogo(texto: String) -> void:
	dialogo.text = texto
	dialogo.visible_characters = 0
	
	for i in range(texto.length() + 1):
		dialogo.visible_characters = i
		await get_tree().create_timer(velocidade).timeout
	
	await get_tree().create_timer(1.0).timeout
