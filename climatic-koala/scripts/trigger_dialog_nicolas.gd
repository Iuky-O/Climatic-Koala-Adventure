extends Area2D

@export var dialog_lines = []

var dialog_lines_1 = [
	"O dia está lindo para um encontro.",
	"Espero que o mundo não acabe agora...",
	"Ela vai chegar logo, certo?",
	"Tchau!"
]

var dialog_lines_2 = [	
	"Muito calor!",
	"Soube que em alguns lugares esta nevando onde nunca nevou.",
	"Chovendo mais que o normal ou secas terríveis.",
	"Isso perde o clima para um encontro.",
]

@export var nome = "Nycolas"

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
