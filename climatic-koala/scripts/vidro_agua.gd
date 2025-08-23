extends Area2D

func _ready() -> void:
	show()


func _process(delta: float) -> void:
	$"../fixo_tela/total_agua".text = str("Água = ", Dados.agua)


func _on_body_entered(body: Node2D) -> void:
	if visible:
		Dados.agua += 1
		$"../fixo_tela/total_agua".text = str("Água = ", Dados.agua)
		hide()
