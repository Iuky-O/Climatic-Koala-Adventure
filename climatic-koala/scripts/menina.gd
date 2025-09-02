#menina
extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var touch_target: Vector2 = Vector2.ZERO
var touch_active: bool = false 


func _ready() -> void:
	print("---------------------------------------")
	print("Menina spawnou em: ", global_position)
	print("Local anterior: ", GameState.local_anterior)
	print("Local atual: ", GameState.local_atual)
	print("Cena", GameState.cena_atual)
	print("---------------------------------------")
	touch_target = global_position

func _exit_tree():
	print("Menina removida da árvore")
	
func _process(delta: float) -> void:
	GameState.local_mapa = Vector2(global_position)
	$fixo_tela/total_agua.text = str("Água = ", Dados.agua)
	$fixo_tela/total_comida.text = str("Comida = ", Dados.comida)
	print("Menina esta em: ", global_position)
	#print("global = ",GameState.local_mapa)

func _input(event):
	if event is InputEventScreenTouch or event is InputEventMouseButton:
		if event.pressed:
			touch_target = event.position
			touch_active = true
		else:
			touch_active = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += ProjectSettings.get_setting("physics/2d/default_gravity") * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Pega direção
	var directionX := Input.get_axis("ui_left", "ui_right")
	var directionY := Input.get_axis("ui_up", "ui_down")
	var direction = Vector2(directionX, directionY).normalized()

	# Movimento por toque se houver
	if touch_active:
		var delta_pos = touch_target - position
		if abs(delta_pos.x) > abs(delta_pos.y):
			direction.x = sign(delta_pos.x)
			direction.y = 0
		else:
			direction.x = 0
			direction.y = sign(delta_pos.y)
		
		if position.distance_to(touch_target) < 10:
			touch_active = false

	# Movimento
	if direction != Vector2.ZERO:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

	# Animações
	if Input.is_action_pressed("ui_left"):
		$AnimatedSprite2D.play("andando_esquerda")
	elif Input.is_action_pressed("ui_right"):
		$AnimatedSprite2D.play("andando_direita")
	else:
		$AnimatedSprite2D.play("parada")
		
	if direction.x < 0:
		$AnimatedSprite2D.play("andando_esquerda")
	elif direction.x > 0:
		$AnimatedSprite2D.play("andando_direita")
	else:
		$AnimatedSprite2D.play("parada")


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_comida_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
