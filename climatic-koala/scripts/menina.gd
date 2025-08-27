#menina
extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready() -> void:
	print("---------------------------------------")
	print("Menina spawnou em: ", global_position)
	print("Local anterior: ", GameState.local_anterior)
	print("Local atual: ", GameState.local_atual)
	print("---------------------------------------")

func _process(delta: float) -> void:
	#print("Menina spawnou em: ", global_position)
	pass
	
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		pass
		# velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Pega direção
	var directionX := Input.get_axis("ui_left", "ui_right")
	var directionY := Input.get_axis("ui_up", "ui_down")
	var direction = Vector2(directionX, directionY).normalized()

	# Movimento
	if direction != Vector2.ZERO:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		$AnimatedSprite2D.play("parada")

	move_and_slide()

	# Animações
	if Input.is_action_pressed("ui_left"):
		$AnimatedSprite2D.play("andando_esquerda")
	elif Input.is_action_pressed("ui_right"):
		$AnimatedSprite2D.play("andando_direita")


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_comida_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
