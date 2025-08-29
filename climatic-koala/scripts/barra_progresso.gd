extends ProgressBar

signal progresso_mudado

var _progresso: int = 0
var nova_xp: int = 25

@export var progresso: int:
	set(value):
		_progresso = value
		emit_signal("progresso_mudado")
	get:
		return _progresso

func _process(delta: float) -> void:
	progresso_mudado.connect(progress_update)
	progress_update()


func progress_update():
	if Dados.pontos:
		_progresso = Dados.pontos * nova_xp
		value = _progresso
