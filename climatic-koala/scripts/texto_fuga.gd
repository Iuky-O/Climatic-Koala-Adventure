extends CanvasLayer

@onready var dialogo = $Label

var text_lines = [
	"Isso é o fim do mundo?!",
	"Preciso fugir!!!!!!"
]

var velocidade = 0.05
var is_dialogue_active = false


func start_dialogue() -> void:
	if is_dialogue_active:
		return
	
	is_dialogue_active = true
	visible = true
	_do_dialogue()

func _do_dialogue():
	for fala in text_lines:
		if not is_inside_tree():
			break
		await mostrar_dialogo(fala)
	
	hide_dialogue()
	is_dialogue_active = false

func mostrar_dialogo(texto: String):
	dialogo.text = texto
	dialogo.visible_characters = 0
	
	for i in range(texto.length() + 1):
		if not is_inside_tree():
			break
		dialogo.visible_characters = i
		await get_tree().create_timer(velocidade).timeout
	
	await get_tree().create_timer(1.0).timeout

func hide_dialogue():
	visible = false
	dialogo.text = ""
	dialogo.visible_characters = 0
	GameState.fuga_mostrado = true

func stop_dialogue():
	if is_dialogue_active:
		hide_dialogue()
		is_dialogue_active = false
