#extends CanvasLayer
#
#var dialog_lines = []
#var current_line = 0
#var personagem_name = ""
#
#var dialog_label
#var dialog_pass
#var dialog_name
#
#func _ready():
	#dialog_label = $Panel/Label
	#dialog_name = $Panel/Label2
	#dialog_pass = $Panel/pass
	#
	#if dialog_pass != null:
		#dialog_pass.connect("pressed", Callable(self, "_on_pass_pressed"))
	#else:
		#push_error("Botão 'pass' não encontrado!")
#
	#visible = false
#
#func start_dialog(lines: Array, nome: String):
	#dialog_lines = lines
	#current_line = 0
	#personagem_name = nome
	#show_dialog()
#
#func show_dialog():
	#visible = true
	#dialog_label.text = dialog_lines[current_line]
	#dialog_name.text = personagem_name
#
#func hide_dialog():
	#visible = false
	#current_line = 0
	#dialog_lines = []
	#personagem_name = ""
#
##func _on_pass_pressed():
	##if current_line < dialog_lines.size() - 1:
		##current_line += 1
		##dialog_label.text = dialog_lines[current_line]
	##else:
		##hide_dialog()
		#
#func _on_pass_pressed():
	#GameState.ui_active = true  # Bloqueia movimento do player
	## Processa diálogo
	#if current_line < dialog_lines.size() - 1:
		#current_line += 1
		#dialog_label.text = dialog_lines[current_line]
	#else:
		#hide_dialog()
	#GameState.ui_active = false  # Libera movimento
extends CanvasLayer

signal dialog_finished

var dialog_lines = []
var current_line = 0
var personagem_name = ""

var dialog_label
var dialog_pass
var dialog_name

func _ready():
	dialog_label = $Panel/Label
	dialog_name = $Panel/Label2
	dialog_pass = $Panel/pass
	
	if dialog_pass != null:
		dialog_pass.connect("pressed", Callable(self, "_on_pass_pressed"))
		# IMPORTANTE: Marcar o botão para capturar toques
		dialog_pass.mouse_filter = Control.MOUSE_FILTER_STOP
	else:
		push_error("Botão 'pass' não encontrado!")

	visible = false

func start_dialog(lines: Array, nome: String):
	dialog_lines = lines
	current_line = 0
	personagem_name = nome
	show_dialog()
	# bloqueia movimento quando o diálogo começa
	GameState.ui_active = true

func show_dialog():
	visible = true
	dialog_label.text = dialog_lines[current_line]
	dialog_name.text = personagem_name

func hide_dialog():
	visible = false
	current_line = 0
	dialog_lines = []
	personagem_name = ""
	# libera movimento quando o diálogo termina
	GameState.ui_active = false
	
	emit_signal("dialog_finished")

func _on_pass_pressed():
	if current_line < dialog_lines.size() - 1:
		current_line += 1
		dialog_label.text = dialog_lines[current_line]
	else:
		hide_dialog()
