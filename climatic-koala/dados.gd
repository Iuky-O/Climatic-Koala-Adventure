extends Node

@export var agua = 0
@export var comida = 0

@export var perguntas = [
	{
		"id": "1",
		"pergunta":"Quanto é 1 + 0?",
		"opc1":"Um",
		"opc2":"Dois",
		"opc3":"Três",
		"resposta":"Um",
	},
	{
		"id": "2",
		"pergunta":"Quanto é 2 + 4?",
		"opc1":"Quatro",
		"opc2":"Cinco",
		"opc3":"Seis",
		"resposta":"Seis",
	},
	{
		"id": "3",
		"pergunta":"Qual a capital do Brasil?",
		"opc1":"Brasília",
		"opc2":"São Paulo",
		"opc3":"Rio de Janeiro",
		"resposta":"Brasília",
	},
]

@export var pontos = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
