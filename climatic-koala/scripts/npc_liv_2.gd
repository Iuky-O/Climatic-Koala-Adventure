extends Area2D

@export var animation_to_play: String = "pessoa 3"

@export var dialog_lines = [
	"Não esqueça, NUNCA jogue lixo na rua ou desmate as árvores.",
	"Só não vem dizendo que não avisei quando estiver morrendo de calor."
]

@export var nome = "João"

func _ready():
	$"npc 2/AnimatedSprite2D".play(animation_to_play)
	
func _on_body_entered(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("DialogBox")
		dialog_box.start_dialog(dialog_lines, nome)
		
		$"npc 2/AnimatedSprite2D".play(animation_to_play)

func _on_body_exited(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("DialogBox")
		dialog_box.hide_dialog()
		
		$"npc 2/AnimatedSprite2D".play(animation_to_play)
