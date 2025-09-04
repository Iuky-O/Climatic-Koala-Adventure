#menina
extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var btn_up = $fixo_tela/controle/CanvasLayer/subir
@onready var btn_down = $fixo_tela/controle/CanvasLayer/descer
@onready var btn_left = $fixo_tela/controle/CanvasLayer/esquerda
@onready var btn_right = $fixo_tela/controle/CanvasLayer/direita

func _ready() -> void:
	print("---------------------------------------")
	print("Menina spawnou em: ", global_position)
	print("Local anterior: ", GameState.local_anterior)
	print("Local atual: ", GameState.local_atual)
	print("---------------------------------------")

func _process(delta: float) -> void:
	#print("---------------------------------------")
	#print("Menina spawnou em: ", global_position)
	#print("Local anterior: ", GameState.local_anterior)
	#print("Local atual: ", GameState.local_atual)
	#print("Cena atual: ", GameState.cena_atual)
	#print("---------------------------------------")
	
	print(GameState.local_mapa)
	GameState.local_mapa = Vector2(global_position)
	$fixo_tela/total_agua.text = str("Água = ", Dados.agua)
	$fixo_tela/total_comida.text = str("Comida = ", Dados.comida)
	
func _physics_process(delta: float) -> void:
	
	if GameState.ui_active:
		velocity = Vector2.ZERO
		$AnimatedSprite2D.play("parada")
		move_and_slide()
		return

	var direction = Vector2.ZERO

	# Movimento teclado
	if Input.is_action_pressed("ui_left"):
		direction.x = -1
	elif Input.is_action_pressed("ui_right"):
		direction.x = 1
	elif Input.is_action_pressed("ui_up"):
		direction.y = -1
	elif Input.is_action_pressed("ui_down"):
		direction.y = 1
		
	# movimento por botões da tela
	elif btn_left.is_pressed():
		direction.x = -1
	elif btn_right.is_pressed():
		direction.x = 1
	elif btn_up.is_pressed():
		direction.y = -1
	elif btn_down.is_pressed():
		direction.y = 1

	if direction != Vector2.ZERO:
		velocity = direction * SPEED
	else:
		velocity = Vector2.ZERO
		
		
	move_and_slide()

	## Animações
	if direction.x < 0:
		$AnimatedSprite2D.play("andando_esquerda")
	elif direction.x > 0:
		$AnimatedSprite2D.play("andando_direita")
	elif direction.y != 0:
		$AnimatedSprite2D.play("andando_direita")
	else:
		$AnimatedSprite2D.play("parada")


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_comida_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
