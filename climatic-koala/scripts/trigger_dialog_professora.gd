extends Area2D

@export var dialog_lines = [
	"Você já sentiu o calor mais intenso ultimamente?",
	"A ODS 13 fala de adaptação a eventos extremos.",
	"Cidades precisam de sombra, água e alerta rápido.",
	"Vamos começar pelo que dá pra mudar hoje?",
]

@export var nome = "Professora"

func _on_body_entered(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("DialogBox")
		dialog_box.start_dialog(dialog_lines, nome)

func _on_body_exited(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("DialogBox")
		dialog_box.hide_dialog()
