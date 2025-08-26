extends Area2D

@export var animation_to_play: String = "pessoa 7"

@export var dialog_lines = [
	"Sou apoiador de coisas ambientais sabe.",
	"Mas só como plantas. Isso seria hipocrisia?",
	"Por falar nisso... saia da minha cozinha."
]

@export var nome = "Wilson"

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
