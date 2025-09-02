extends Area2D

@export var dialog_lines = []

var dialog_lines_1 = [
	"Hoje sim... é um bom dia!",
	"Ando menos ansioso agora.",
	"Você ainda está muito perto.. Saia.",
]

var dialog_lines_2 = [	
	"Você está muito perto.",
	"O clima está cada dia mais estranho...",
	"Os animais sumiram ou morreram... isso é desesperador.",
	"Hum, perto demias. Saia ou vai se ver com a minha namorada.",
]

@export var nome = "Eduardo"

func _ready() -> void:
	set_dialog_lines()
	
func _on_body_entered(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("DialogBox")
		dialog_box.start_dialog(dialog_lines, nome)

func _on_body_exited(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("DialogBox")
		dialog_box.hide_dialog()

func set_dialog_lines():
	var progresso = Dados.progresso_atual
	
	if progresso >= 50:
		dialog_lines = dialog_lines_1
	else:
		dialog_lines = dialog_lines_2
