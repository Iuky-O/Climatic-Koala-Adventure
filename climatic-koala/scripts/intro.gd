extends Area2D

@export var dialog_lines = [
	"As sirenes de evacuação soam em toda a costa, e a situação se agrava a cada minuto.",
	"O megatsunami, resultado direto do colapso da plataforma de gelo na Antártida, já atingiu o litoral sul.",
	" Nossas equipes reportam inundações catastróficas e a destruição de infraestruturas críticas.",
	"Repetimos: quem ainda estiver na zona de risco deve procurar os abrigos nas terras altas imediatamente.",
	"As montanhas são o único refúgio seguro. O relógio está correndo, e a natureza não espera.",
]

@export var nome = "Noticiario"

func _on_body_entered(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("DialogBox")
		dialog_box.start_dialog(dialog_lines, nome)

func _on_body_exited(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("DialogBox")
		dialog_box.hide_dialog()
