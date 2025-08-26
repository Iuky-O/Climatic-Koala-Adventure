extends Area2D

func _ready() -> void:
	show()


func _process(delta: float) -> void:
	$"../fixo_tela/total_comida".text = str("Comida = ", Dados.comida)


func _on_body_entered(body: Node2D) -> void:
	if visible:
		Dados.comida += 1
		$"../fixo_tela/total_comida".text = str("Comida = ", Dados.comida)
		hide()
