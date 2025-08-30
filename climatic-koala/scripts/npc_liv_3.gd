extends Area2D

@export var animation_to_play: String = "pessoa 4"

@export var dialog_lines = [
	"Eu amo ler sabe... gosto muito de romance.",
	"Mas arrisco ler terror também.",
	"Hou Hou Hou"
]

@export var nome = "Ju"

func _ready():
	$"npc 3/AnimatedSprite2D".play(animation_to_play)
	
func _on_body_entered(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("DialogBox")
		dialog_box.start_dialog(dialog_lines, nome)
		
		$"npc 3/AnimatedSprite2D".play(animation_to_play)

func _on_body_exited(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("DialogBox")
		dialog_box.hide_dialog()
		
		$"npc 3/AnimatedSprite2D".play(animation_to_play)
