extends Camera2D

func _ready():
	ajustar_camera()
	get_viewport().size_changed.connect(ajustar_camera) # conecta o sinal de resize

func ajustar_camera():
	var viewport_size = get_viewport().get_visible_rect().size
	var base_size = Vector2(1280, 720) # tamanho base do mapa
	var zoom_factor = viewport_size / base_size
	zoom = Vector2(1.0 / zoom_factor.x, 1.0 / zoom_factor.y)
