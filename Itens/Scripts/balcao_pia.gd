extends BrilhoAoToque

@export var Tabua : Marker2D = null

const COPO : String = "Copo"

const FRIGIDEIRA : String = "Frigideira"

const PENEIRA : String = "Peneira"

const CHALEIRA : String = "Chaleira"

var Frigideira : InterageMouse = null

var Copo : InterageMouse = null

var Peneira : InterageMouse = null

var Chaleira : InterageMouse = null

var CopoAgua : InterageMouse = null

var tweenPos : Tween = null

func _process(_delta: float) -> void:
	receitaCopoOleo()
	receitaCopoAgua()

func playerColidindo(_area : Area2D):
	if _area is InterageMouse:
		if (_area.name == COPO or _area.name == COPO + "2" or _area.name == COPO + "3") and _area.get_node("Sprite2D").frame == 0 and not Copo:
			Copo = _area
			colocaNaTabua(Copo)
			return
		elif (_area.name == COPO or _area.name == COPO + "2" or _area.name == COPO + "3") and _area.get_node("Sprite2D").frame == 3 and not Copo:
			Copo = _area
			colocaNaTabua(Copo)
			return
		elif _area.name == PENEIRA and not Peneira:
			Peneira = _area
			colocaNaTabua(Peneira)
			return
		elif _area.name == FRIGIDEIRA and _area.get_node("Sprite2D").frame == 2 and not Frigideira:
			Frigideira = _area
			colocaNaTabua(Frigideira)
		elif _area.name == CHALEIRA and _area.get_node("Sprite2D").frame == 2:
			Chaleira = _area
			return

	verificacao(_area)
	if not jogador: return
	Sprite.frame = 1

func playerNaoColidindo(_area : Area2D):
	for _elemento in [Copo, Frigideira, Peneira, Chaleira, CopoAgua]:
		_elemento = null if _elemento == _area else _elemento

	verificacao(_area)
	Sprite.frame = 0


func colocaNaTabua(_objeto : InterageMouse):
	if tweenPos: tweenPos.kill()
	tweenPos = create_tween().bind_node(self)
	tweenPos.tween_property(_objeto, "global_position", Tabua.global_position, 0.25).set_ease(Tween.EASE_OUT)

func receitaCopoOleo():
	if Copo and Frigideira and Peneira:
		Copo.get_node("Sprite2D").frame = 1
		Copo.corte = Rect2(9.0, 0.0, 9.0, 0.0)
		Frigideira.get_node("Sprite2D").frame = 3
		Frigideira.corte = Rect2(63.0, 0.0, 21.0, 0.0)
		Peneira.get_node("Sprite2D").frame = 1
		Peneira.corte = Rect2(0.0, 0.0, 18.0, 0.0)
		Copo = null
		Frigideira = null
		Peneira = null
		Global.PROGRESSAO = 8

func receitaCopoAgua():
	if Copo and Chaleira:
		Copo.get_node("Sprite2D").frame = 3
		Copo.corte = Rect2(27.0, 0.0, 9.0, 0.0)
		Chaleira.get_node("Sprite2D").frame = 0
		Chaleira.corte = Rect2(0.0, 0.0, 15.0, 0.0)
		CopoAgua = Copo
		Copo = null
		Chaleira = null
		Global.PROGRESSAO = 11
