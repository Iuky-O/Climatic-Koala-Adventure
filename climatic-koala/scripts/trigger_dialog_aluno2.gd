extends Area2D

@export var animation_to_play: String = "rosa"

@export var dialog_lines = [
	"Eu quero ser professora.",
	"Vou ensinar sobre sobrevivência hahaha"
]

@export var nome = "Rosinha"

func _ready():
	$"alunos 2/AnimatedSprite2D".play(animation_to_play)
	
func _on_body_entered(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("DialogBox")
		dialog_box.start_dialog(dialog_lines, nome)
		
		$"alunos 2/AnimatedSprite2D".play(animation_to_play)

func _on_body_exited(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("DialogBox")
		dialog_box.hide_dialog()
		
		$"alunos 2/AnimatedSprite2D".play(animation_to_play)
