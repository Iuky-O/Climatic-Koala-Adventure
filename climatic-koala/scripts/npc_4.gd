extends Area2D

@export var animation_to_play: String = "pessoa 6"

@export var dialog_lines = [
	"Oi querida (a)",
	"Você até que é bonitinha(o)"
]

@export var nome = "Stefany"

func _ready():
	$"npc 4/AnimatedSprite2D".play(animation_to_play)
	
func _on_body_entered(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("DialogBox")
		dialog_box.start_dialog(dialog_lines, nome)
		
		$"npc 4/AnimatedSprite2D".play(animation_to_play)

func _on_body_exited(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("DialogBox")
		dialog_box.hide_dialog()
		
		$"npc 4/AnimatedSprite2D".play(animation_to_play)
