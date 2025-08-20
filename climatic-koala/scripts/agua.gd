extends Area2D

var num_agua = 0

func _ready() -> void:
	$AnimatedSprite2D.frame = 0


func _process(delta: float) -> void:
	$"../fixo_tela/total_agua".text = str("Sementes = ", num_agua)


func _on_body_entered(body: Node2D) -> void:
	#show()
	#$AnimatedSprite2D.frame = 0
	#
	##faz crescer
	#for i in range(5):
		#await get_tree().create_timer(3.0).timeout
		#$AnimatedSprite2D.frame = i+1
		
	
	if visible:
		num_agua += 1
		$"../fixo_tela/total_agua".text = str("Sementes = ", num_agua)
		hide()
