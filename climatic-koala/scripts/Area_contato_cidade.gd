# area_dialogo_carro.gd
extends Area2D

@onready var dialogo_scene = preload("res://cena - itens/dialogo_carro.tscn")
var dialogo_instance
var dialogo_iniciado = false

func _ready():
	if body_entered.get_connections().size() == 0:
		connect("body_entered", _on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("carro") and not dialogo_iniciado:
		dialogo_iniciado = true

		if body.has_method("set_physics_process"):
			body.set_physics_process(false)

		dialogo_instance = dialogo_scene.instantiate()
		get_tree().current_scene.add_child(dialogo_instance)

		await get_tree().create_timer(0.1).timeout
		dialogo_instance.iniciar_dialogo()
