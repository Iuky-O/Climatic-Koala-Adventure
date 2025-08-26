extends Area2D

@export var animation_to_play: String = "verde"

@export var dialog_lines = [
	"Eu amo vir a escola.",
	"Tem a merenda e a professora é muito bonita."
]

@export var nome = "Vernon"

func _ready():
	$"alunos 3/AnimatedSprite2D".play(animation_to_play)
	
func _on_body_entered(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("DialogBox")
		dialog_box.start_dialog(dialog_lines, nome)
		
		$"alunos 3/AnimatedSprite2D".play(animation_to_play)

func _on_body_exited(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("DialogBox")
		dialog_box.hide_dialog()
		
		$"alunos 3/AnimatedSprite2D".play(animation_to_play)
