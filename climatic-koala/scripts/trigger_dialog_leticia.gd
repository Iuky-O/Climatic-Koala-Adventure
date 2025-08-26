extends Area2D

@export var dialog_lines = [
	"Oi! Você parece novo aqui.",
	"Cuidado por ai, aqui é mais perigoso do que parece.",
	"Se bem que somos os mais perigosos aqui.",
	"Boa sorte na sua jornada!",
]

@export var nome = "Letícia"

func _on_body_entered(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("DialogBox")
		dialog_box.start_dialog(dialog_lines, nome)

func _on_body_exited(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("DialogBox")
		dialog_box.hide_dialog()
