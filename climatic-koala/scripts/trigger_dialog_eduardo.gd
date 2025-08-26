extends Area2D

@export var dialog_lines = [
	"Você está muito perto.",
	"O clima está cada dia mais estranho.",
	"Saia ou vai se ver com a minha namorada.",
]

@export var nome = "Eduardo"

func _on_body_entered(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("DialogBox")
		dialog_box.start_dialog(dialog_lines, nome)

func _on_body_exited(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("DialogBox")
		dialog_box.hide_dialog()
