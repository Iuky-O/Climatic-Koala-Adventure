extends Area2D

@export var dialog_lines = [
	"Você já imaginou como seria ter poderes?",
	"Estou na dúvida se prefiro voar ou teletransportar.",
	"Hum, estou achando que esse lago tem menos peixes hoje.",
	"Vai na sombra."
]

@export var nome = "Iumy"

func _on_body_entered(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("DialogBox")
		dialog_box.start_dialog(dialog_lines, nome)

func _on_body_exited(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("DialogBox")
		dialog_box.hide_dialog()
