extends CanvasLayer

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
	else:
		push_error("Botão 'pass' não encontrado!")

	visible = false

func start_dialog(lines: Array, nome: String):
	dialog_lines = lines
	current_line = 0
	personagem_name = nome
	show_dialog()

func show_dialog():
	visible = true
	dialog_label.text = dialog_lines[current_line]
	dialog_name.text = personagem_name

func hide_dialog():
	visible = false
	current_line = 0
	dialog_lines = []
	personagem_name = ""

func _on_pass_pressed():
	if current_line < dialog_lines.size() - 1:
		current_line += 1
		dialog_label.text = dialog_lines[current_line]
	else:
		hide_dialog()
