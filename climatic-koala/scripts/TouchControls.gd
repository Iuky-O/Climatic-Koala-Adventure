#canvas layer
#extends CanvasLayer
#
#signal direction_input(dir: Vector2)
#signal action_pressed()
#
#var dir := Vector2.ZERO
#
#func _ready():
	#$Esquerda.connect("button_down", Callable(self, "_on_left_down"))
	#$Esquerda.connect("button_up", Callable(self, "_on_left_up"))
	#$Direita.connect("button_down", Callable(self, "_on_right_down"))
	#$Direita.connect("button_up", Callable(self, "_on_right_up"))
	#$Acao.connect("pressed", Callable(self, "_on_action"))
#
#func _on_left_down():
	#dir.x = -1
	#emit_signal("direction_input", dir)
#
#func _on_left_up():
	#if dir.x == -1:
		#dir.x = 0
	#emit_signal("direction_input", dir)
#
#func _on_right_down():
	#dir.x = 1
	#emit_signal("direction_input", dir)
#
#func _on_right_up():
	#if dir.x == 1:
		#dir.x = 0
	#emit_signal("direction_input", dir)
#
#func _on_action():
	#emit_signal("action_pressed")

#toucehcontrol
extends CanvasLayer

signal direction_input(dir: Vector2)
signal action_pressed()

var dir := Vector2.ZERO

func _ready():
	# Conecta os botões
	$HBoxContainer/Esquerda.connect("button_down", Callable(self, "_on_left_down"))
	$HBoxContainer/Esquerda.connect("button_up", Callable(self, "_on_left_up"))

	$HBoxContainer/Direita.connect("button_down", Callable(self, "_on_right_down"))
	$HBoxContainer/Direita.connect("button_up", Callable(self, "_on_right_up"))

	$HBoxContainer/VBoxContainer/Cima.connect("button_down", Callable(self, "_on_up_down"))
	$HBoxContainer/VBoxContainer/Cima.connect("button_up", Callable(self, "_on_up_up"))

	$HBoxContainer/VBoxContainer/Baixo.connect("button_down", Callable(self, "_on_down_down"))
	$HBoxContainer/VBoxContainer/Baixo.connect("button_up", Callable(self, "_on_down_up"))

	#$Acao.connect("pressed", Callable(self, "_on_action"))  # Ative se tiver botão de ação

	# Se o player já existir, conecta o sinal
	if GameState.player != null:
		connect("direction_input", Callable(GameState.player, "_on_touch_direction_input"))

# ESQUERDA / DIREITA
func _on_left_down():
	dir.x = -1
	emit_signal("direction_input", dir)

func _on_left_up():
	if dir.x == -1:
		dir.x = 0
	emit_signal("direction_input", dir)

func _on_right_down():
	dir.x = 1
	emit_signal("direction_input", dir)

func _on_right_up():
	if dir.x == 1:
		dir.x = 0
	emit_signal("direction_input", dir)

# CIMA / BAIXO
func _on_up_down():
	dir.y = -1
	emit_signal("direction_input", dir)

func _on_up_up():
	if dir.y == -1:
		dir.y = 0
	emit_signal("direction_input", dir)

func _on_down_down():
	dir.y = 1
	emit_signal("direction_input", dir)

func _on_down_up():
	if dir.y == 1:
		dir.y = 0
	emit_signal("direction_input", dir)

# AÇÃO
func _on_action():
	emit_signal("action_pressed")
