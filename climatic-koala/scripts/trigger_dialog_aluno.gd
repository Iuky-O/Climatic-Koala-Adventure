extends Area2D

@export var animation_to_play: String = "amarelo"

@export var dialog_lines = [
	"Sabe eu tenho medo do rumo que o mundo está indo.",
	"E olha que sou crinça."
]

@export var nome = "Amarilo"

func _ready():
	$alunos/AnimatedSprite2D.play(animation_to_play)
	
func _on_body_entered(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("DialogBox")
		dialog_box.start_dialog(dialog_lines, nome)
		
		$alunos/AnimatedSprite2D.play(animation_to_play)

func _on_body_exited(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("DialogBox")
		dialog_box.hide_dialog()
		
		$alunos/AnimatedSprite2D.play(animation_to_play)
