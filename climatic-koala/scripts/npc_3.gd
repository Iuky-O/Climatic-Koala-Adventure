extends Area2D

@export var animation_to_play: String = "pessoa 5"

@export var dialog_lines = [
	"Oi! Você sabia que existe a ODS 13?",
	"Ela fala sobre combater a mudança do clima e seus efeitos.",
	"Isso inclui reduzir gases poluentes e proteger ecossistemas.",
	"Pequenas ações do dia a dia já ajudam muito!",
]

@export var nome = "Marco"

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
