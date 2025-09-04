extends Area2D

var text_lines = [
	"Isso é o fim do mundo?!",
	"Preciso fugir!!!!!!"
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("texto")
		dialog_box.start_dialogue(text_lines)

		# Desativa a área para não disparar mais
		set_monitoring(false)
		set_monitorable(false)

func _on_body_exited(body):
	if body.is_in_group("player"):
		var dialog_box = get_parent().get_node("texto")
		dialog_box.hide_dialogue()
