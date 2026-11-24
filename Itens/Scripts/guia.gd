extends EnteragePlayer

@export var Mensagem : Label = null

@export var DialogoTela : PackedScene = null

const TEMPO : float = 0.1

const POS_Y_ORIGINAL : float = -40

const POS_Y_ESCONDIDO : float = -35

const COR_ORIGINAL : Color = Color.WHITE

const COR_ESCONDIDA : Color = Color(0.145, 0.086, 0.31, 0.0)

var dialogo : TelaDialogo = null

var tweenPrecionar : Tween = null

var possoComecarDialogo : bool = false

func _process(_delta: float):
	if Input.is_physical_key_pressed(KEY_E) and possoComecarDialogo and not dialogo:
		possoComecarDialogo = false
		dialogo = DialogoTela.instantiate()
		add_child(dialogo)
		dialogo.dados = Dialogos.escolhaDialogo(Global.PROGRESSAO)
		dialogo.acabaDialogo.connect(posFala)
		dialogo.entrandoEmTela()

func playerColidindo(_area : Area2D):
	verificacao(_area)
	if not jogador: return
	if tweenPrecionar: tweenPrecionar.kill()
	tweenPrecionar = create_tween().bind_node(self)
	tweenPrecionar.tween_property(Mensagem, "position:y", POS_Y_ORIGINAL, TEMPO)
	tweenPrecionar.tween_property(Mensagem, "modulate", COR_ORIGINAL, TEMPO)
	await tweenPrecionar.finished
	possoComecarDialogo = true

func playerNaoColidindo(_area : Area2D):
	verificacao(_area) 
	if tweenPrecionar: tweenPrecionar.kill()
	tweenPrecionar = create_tween().bind_node(self)
	tweenPrecionar.tween_property(Mensagem, "position:y", POS_Y_ESCONDIDO, TEMPO)
	tweenPrecionar.tween_property(Mensagem, "modulate", COR_ESCONDIDA, TEMPO)
	await tweenPrecionar.finished
	possoComecarDialogo = false

func posFala():
	if Global.PROGRESSAO == 1:
		insereBalao("ovo_frito")
	elif Global.PROGRESSAO == 6 or Global.PROGRESSAO == 7:
		insereBalao("copo_oleo")
		if Global.PROGRESSAO == 6: Global.PROGRESSAO = 7
	elif Global.PROGRESSAO == 8:
		insereBalao("chaleira_agua")
	elif Global.PROGRESSAO == 9 or Global.PROGRESSAO == 10:
		insereBalao("chaleira_morna")
		
	

func insereBalao(_receita : String = ""):
	if _receita == "": return
	jogador.BalaoReceita.entrar(jogador.BalaoReceita.RECEITAS[_receita])
	await get_tree().create_timer(6).timeout
	jogador.BalaoReceita.sair()
