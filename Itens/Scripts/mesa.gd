extends BrilhoAoToque

@export var OvosFritos : PackedScene = null

@export var GuadadorItens : Node2D = null

@export var Pratos : Array[Marker2D] = []

const FRIGIDEIRA : String = "Frigideira"

var Frigideira : InterageMouse = null

var ovosFritos : Area2D = null

var listaEspera : Array[int] = []

func playerColidindo(_area : Area2D):
	if _area is InterageMouse:
		if _area.name == FRIGIDEIRA and _area.get_node("Sprite2D").frame == 1:
			Frigideira = _area
			Frigideira.get_node("Sprite2D").frame = 2
			Frigideira.corte = Rect2(42.0, 0.0, 21.0, 0.0)
			achaPratoDisponivel(Frigideira)
			Global.PROGRESSAO = 4
			ovosFritos = OvosFritos.instantiate()
			ovosFritos.global_position = jogador.global_position
			ovosFritos.player = jogador
			GuadadorItens.call_deferred("add_child", ovosFritos)
			achaPratoDisponivel(ovosFritos)

	verificacao(_area)
	if not jogador: return
	Sprite.frame = 1

func achaPratoDisponivel(_objeto : Node):
	if listaEspera.size() >= Pratos.size() - 1: return
	listaEspera.append(0)
	var tweenPos : Tween = null
	for _i in range(Pratos.size()):
		if tweenPos: tweenPos.kill()
		tweenPos = create_tween().bind_node(self)
		tweenPos.tween_property(_objeto, "global_position", Pratos[listaEspera.size() - 1].global_position, 0.25).set_ease(Tween.EASE_OUT)
		await tweenPos.finished
		break
