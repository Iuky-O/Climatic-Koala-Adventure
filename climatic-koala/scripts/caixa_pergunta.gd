extends CanvasLayer

var pergunta_atual

# Referências UI
var lbl_pergunta
var btn1
var btn2
var btn3

func _ready():
	lbl_pergunta = $"Panel/LabelPergunta"
	btn1 = $"Panel/Button 1"
	btn2 = $"Panel/Button 2"
	btn3 = $"Panel/Button 3"

	# Conectar sinais dos botões
	btn1.connect("pressed", Callable(self, "_on_responder").bind(btn1))
	btn2.connect("pressed", Callable(self, "_on_responder").bind(btn2))
	btn3.connect("pressed", Callable(self, "_on_responder").bind(btn3))

	proxima_pergunta()

func proxima_pergunta():
	if Dados.perguntas.size() == 0:
		lbl_pergunta.text = "Fim do jogo! Pontos: %d" % Dados.pontos
		btn1.disabled = true
		btn2.disabled = true
		btn3.disabled = true
		return

	# Pegar uma pergunta aleatória e remover da lista
	var indice = randi() % Dados.perguntas.size()
	pergunta_atual = Dados.perguntas[indice]
	Dados.perguntas.remove_at(indice)

	# Mostrar pergunta e respostas
	lbl_pergunta.text = pergunta_atual["pergunta"]
	btn1.text = pergunta_atual["opc1"]
	btn2.text = pergunta_atual["opc2"]
	btn3.text = pergunta_atual["opc3"]

	# Resetar cores
	resetar_cores()

func _on_responder(botao):
	var resposta_certa = pergunta_atual["resposta"]

	if botao.text == resposta_certa:
		Dados.pontos += 1
		botao.modulate = Color(0, 1, 0) # Verde
	else:
		botao.modulate = Color(1, 0, 0) # Vermelho
		# Mostrar também qual era o correto
		if btn1.text == resposta_certa:
			btn1.modulate = Color(0, 1, 0)
		elif btn2.text == resposta_certa:
			btn2.modulate = Color(0, 1, 0)
		elif btn3.text == resposta_certa:
			btn3.modulate = Color(0, 1, 0)

	# Esperar 1 segundo e trocar para próxima
	await get_tree().create_timer(1.0).timeout
	proxima_pergunta()

func resetar_cores():
	btn1.modulate = Color(1, 1, 1)
	btn2.modulate = Color(1, 1, 1)
	btn3.modulate = Color(1, 1, 1)
