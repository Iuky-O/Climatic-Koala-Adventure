# Script do TileMapLayer (controle do fluxo)
extends TileMapLayer

@onready var noticiario = $DialogBox
@onready var fuga = $texto

func _ready():
	noticiario.connect("dialog_finished", Callable(self, "_on_noticiario_finished"))

func _on_noticiario_finished():
	fuga.start_dialogue()
