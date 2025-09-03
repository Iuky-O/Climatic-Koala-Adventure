extends Node

@export var agua = 0
@export var comida = 0

@export var pontos = 0
var progresso_atual: int = 0
var pergunta_em_andamento = null

@export var perguntas = [
	{
		"id": "1",
		"pergunta":"Você saiu de casa e esqueceu a luz acesa. O que é melhor fazer?",
		"opc1":"Deixar ligada, não faz diferença",
		"opc2":"Voltar e apagar a luz",
		"opc3":"Abrir mais janelas",
		"resposta":"Voltar e apagar a luz",
	},
	{
		"id": "2",
		"pergunta":"No mercado, qual atitude ajuda o clima?",
		"opc1":"Usar sacolas reutilizáveis",
		"opc2":"Pegar várias sacolas plásticas",
		"opc3":"Comprar e jogar fora sacolas novas sempre",
		"resposta":"Usar sacolas reutilizáveis",
	},
	{
		"id": "3",
		"pergunta":"Está muito calor na cidade. O que pode ser feito para ajudar?",
		"opc1":"Plantar árvores",
		"opc2":"Usar mais ar-condicionado",
		"opc3":"Construir mais prédios sem áreas verdes",
		"resposta":"Plantar árvores",
	},
	{
		"id": "4",
		"pergunta":"Qual atitude no transporte contribui para reduzir poluição?",
		"opc1":"Andar sempre de carro sozinho",
		"opc2":"Usar bicicleta ou transporte público",
		"opc3":"Acelerar forte no trânsito",
		"resposta":"Usar bicicleta ou transporte público",
	},
	{
		"id": "5",
		"pergunta":"Quando você vê lixo na rua, o que é melhor fazer?",
		"opc1":"Ignorar, não é meu problema",
		"opc2":"Jogar mais lixo junto",
		"opc3":"Recolher e descartar no lugar certo",
		"resposta":"Recolher e descartar no lugar certo",
	},
	{
		"id": "6",
		"pergunta":"O que acontece quando há muito desmatamento?",
		"opc1":"Aumenta a captura de carbono",
		"opc2":"O clima fica mais instável",
		"opc3":"A floresta cresce mais rápido",
		"resposta":"O clima fica mais instável",
	},
	{
		"id": "7",
		"pergunta":"Qual prática ajuda a economizar água?",
		"opc1":"Deixar a torneira aberta",
		"opc2":"Tomar banhos longos",
		"opc3":"Fechar a torneira ao escovar os dentes",
		"resposta":"Fechar a torneira ao escovar os dentes",
	},
	{
		"id": "8",
		"pergunta":"Por que plantar árvores é importante para o clima?",
		"opc1":"Porque elas liberam mais gases poluentes",
		"opc2":"Porque ajudam a absorver CO2",
		"opc3":"Porque aumentam a poluição",
		"resposta":"Porque ajudam a absorver CO2",
	},
	{
		"id": "9",
		"pergunta":"O que pode acontecer com o aumento da temperatura global?",
		"opc1":"Mais ondas de calor e derretimento de geleiras",
		"opc2":"Invernos mais frios",
		"opc3":"Menos eventos extremos",
		"resposta":"Mais ondas de calor e derretimento de geleiras",
	},
	{
		"id": "10",
		"pergunta":"Qual dessas atitudes ajuda a reduzir a poluição do ar?",
		"opc1":"Queimar lixo",
		"opc2":"Usar energia solar",
		"opc3":"Deixar o carro ligado parado",
		"resposta":"Usar energia solar",
	},
	{
		"id": "11",
		"pergunta":"O que é reciclar?",
		"opc1":"Transformar materiais usados em novos produtos",
		"opc2":"Jogar o lixo em qualquer lugar",
		"opc3":"Usar mais plástico descartável",
		"resposta":"Transformar materiais usados em novos produtos",
	},
	{
		"id": "12",
		"pergunta":"Se jogarmos lixo nos rios, o que pode acontecer?",
		"opc1":"Aumenta a vida aquática",
		"opc2":"Polui a água e causa enchentes",
		"opc3":"Limpa os oceanos",
		"resposta":"Polui a água e causa enchentes",
	},
	{
		"id": "13",
		"pergunta":"O que é a ODS 13?",
		"opc1":"Uma meta para combater mudanças climáticas",
		"opc2":"Um plano para construir mais cidades",
		"opc3":"Um programa de reciclagem de plástico",
		"resposta":"Uma meta para combater mudanças climáticas",
	},
	{
		"id": "14",
		"pergunta":"Como podemos contribuir para a ODS 13 no dia a dia?",
		"opc1":"Usando transporte público ou bicicleta",
		"opc2":"Deixando lâmpadas acesas sempre",
		"opc3":"Comprando mais produtos descartáveis",
		"resposta":"Usando transporte público ou bicicleta",
	},
	{
		"id": "15",
		"pergunta":"Por que reduzir gases do efeito estufa é importante?",
		"opc1":"Porque ajuda a estabilizar o clima e reduzir desastres naturais",
		"opc2":"Porque aumenta a poluição do ar",
		"opc3":"Porque aumenta o aquecimento global",
		"resposta":"Porque ajuda a estabilizar o clima e reduzir desastres naturais",
	},
	{
		"id": "16",
		"pergunta":"O que significa 'adaptação às mudanças climáticas' na ODS 13?",
		"opc1":"Preparar cidades e comunidades para eventos extremos",
		"opc2":"Construir prédios mais altos",
		"opc3":"Usar mais energia de combustíveis fósseis",
		"resposta":"Preparar cidades e comunidades para eventos extremos",
	},
	{
		"id": "17",
		"pergunta":"Plantar árvores ajuda a ODS 13 porque:",
		"opc1":"As árvores absorvem CO₂ e ajudam a combater o aquecimento global",
		"opc2":"As árvores produzem gases do efeito estufa",
		"opc3":"Plantar árvores não tem impacto",
		"resposta":"As árvores absorvem CO₂ e ajudam a combater o aquecimento global",
	},
	{
		"id": "18",
		"pergunta":"Por que a ODS 13 fala sobre educação e conscientização?",
		"opc1":"Porque conhecimento ajuda pessoas a mudarem hábitos e protegerem o clima",
		"opc2":"Porque só especialistas precisam saber",
		"opc3":"Porque a educação não influencia o clima",
		"resposta":"Porque conhecimento ajuda pessoas a mudarem hábitos e protegerem o clima",
	},
	{
		"id": "19",
		"pergunta":"Usar energia limpa como solar ou eólica contribui para a ODS 13 porque:",
		"opc1":"Reduz a emissão de gases que aquecem o planeta",
		"opc2":"Aumenta o consumo de combustível fóssil",
		"opc3":"Não tem efeito no clima",
		"resposta":"Reduz a emissão de gases que aquecem o planeta",
	},
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
