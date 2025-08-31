extends CanvasLayer

var pergunta_atual = null
var pergunta_indice := -1

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

	# Conectar sinais dos botões (apenas uma vez)
	btn1.connect("pressed", Callable(self, "_on_responder").bind(btn1))
	btn2.connect("pressed", Callable(self, "_on_responder").bind(btn2))
	btn3.connect("pressed", Callable(self, "_on_responder").bind(btn3))

	if Dados.pergunta_em_andamento != null:
		pergunta_atual = Dados.pergunta_em_andamento
		pergunta_indice = _find_pergunta_index_by_id(pergunta_atual.get("id", null))
		_mostrar_pergunta()
	else:
		proxima_pergunta()

func proxima_pergunta():
	if pergunta_atual != null:
		return

	if Dados.perguntas.size() == 0:
		lbl_pergunta.text = "Fim do jogo! Pontos: %d" % Dados.pontos
		btn1.disabled = true
		btn2.disabled = true
		btn3.disabled = true
		return

	# Pegar uma pergunta aleatória sem removê-la da lista ainda
	var indice = randi() % Dados.perguntas.size()
	pergunta_indice = indice
	pergunta_atual = Dados.perguntas[indice]

	# salva a pergunta em andamento no autoload para persistência entre cenas
	Dados.pergunta_em_andamento = pergunta_atual

	_mostrar_pergunta()

func _mostrar_pergunta():
	if pergunta_atual == null:
		return

	lbl_pergunta.text = pergunta_atual["pergunta"]
	btn1.text = pergunta_atual["opc1"]
	btn2.text = pergunta_atual["opc2"]
	btn3.text = pergunta_atual["opc3"]

	# Resetar cores e habilitar botões
	resetar_cores()
	btn1.disabled = false
	btn2.disabled = false
	btn3.disabled = false
	visible = true  # mostra o CanvasLayer se estiver escondido

func _on_responder(botao):
	if pergunta_atual == null:
		return

	var resposta_certa = pergunta_atual["resposta"]

	# desativa botões pra evitar múltiplos cliques
	btn1.disabled = true
	btn2.disabled = true
	btn3.disabled = true

	if botao.text == resposta_certa:
		Dados.pontos += 1
		# atualize progresso como preferir:
		Dados.progresso_atual += 25
		botao.modulate = Color(0, 1, 0) # Verde
	else:
		botao.modulate = Color(1, 0, 0) # Vermelho
		# mostrar qual era o correto
		if btn1.text == resposta_certa:
			btn1.modulate = Color(0, 1, 0)
		elif btn2.text == resposta_certa:
			btn2.modulate = Color(0, 1, 0)
		elif btn3.text == resposta_certa:
			btn3.modulate = Color(0, 1, 0)

	# esperar 1 segundo e então remover a pergunta da lista e avançar
	await get_tree().create_timer(1.0).timeout

	# remove a pergunta da lista (segura somente aqui, quando já foi respondida)
	if pergunta_indice >= 0 and pergunta_indice < Dados.perguntas.size():
		# certifica-se que a pergunta ainda é a mesma (verifica id)
		var id_atual = pergunta_atual.get("id", null)
		if id_atual != null and Dados.perguntas[pergunta_indice].get("id", null) == id_atual:
			Dados.perguntas.remove_at(pergunta_indice)
		else:
			# procura pelo id e remove se encontrar
			var idx = _find_pergunta_index_by_id(id_atual)
			if idx >= 0:
				Dados.perguntas.remove_at(idx)

	# limpa pergunta em andamento do autoload e do UI
	Dados.pergunta_em_andamento = null
	pergunta_atual = null
	pergunta_indice = -1

	# vai para a próxima (se houver)
	proxima_pergunta()

func resetar_cores():
	btn1.modulate = Color(1, 1, 1)
	btn2.modulate = Color(1, 1, 1)
	btn3.modulate = Color(1, 1, 1)

# utilitário para encontrar índice por id (retorna -1 se não achar)
func _find_pergunta_index_by_id(id_val):
	if id_val == null:
		return -1
	for i in Dados.perguntas.size() - 1:
		pass # evita lint, substituíremos abaixo
	# implementação correta:
	for i in range(Dados.perguntas.size()):
		if Dados.perguntas[i].get("id", null) == id_val:
			return i
	return -1
