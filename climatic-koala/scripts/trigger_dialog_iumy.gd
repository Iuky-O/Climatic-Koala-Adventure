extends Area2D

@export var dialog_lines = []

var dialog_lines_1 = [
	"Você ja imaginou como seria ter poderes?",
	"Estou na duvida se prefiro voar ou teletransportar...",
	"Estou feliz pelo clima estar mais fresco hoje em dia, obrigada!.",
	"Vai na sombra."
]

var dialog_lines_2 = [
	"Estou com tanto calor!",
	"Aqui perto do rio e' o lugar mais refrescante...",
	"Hum, estou achando que esse lago tem menos peixes hoje.",
	"Vai na sombra."
]

@export var nome = "Iumy"

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
