extends Area2D

@export var dialog_lines = []

var dialog_lines_1 = [	
	"Estou tao feliz!",
	"O clima melhorou bastante graças a voce...",
	"Mas nao esqueça, isso e' apenas o começo.",
	"Nao podemos parar nunca.",
	"Obrigada, ate a proxima!",
]

var dialog_lines_2 = [
	"Oi! Voce parece novo aqui.",
	"Cuidado por ai, aqui e' mais perigoso do que parece...",
	"Se bem que somos os mais perigosos aqui.",
	"Boa sorte na sua jornada!",
]

@export var nome = "Letícia"

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
