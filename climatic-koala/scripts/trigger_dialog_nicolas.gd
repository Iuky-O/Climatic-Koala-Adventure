extends Area2D

@export var dialog_lines = [
	"O dia está lindo para um encontro.",
	"Espero que o mundo não acabe agora.",
	"Ela vai chegar logo, certo?",
	"Tchau!"
]

@export var nome = "Nicolas"

func _on_body_entered(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("DialogBox")
		dialog_box.start_dialog(dialog_lines, nome)

func _on_body_exited(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("DialogBox")
		dialog_box.hide_dialog()
