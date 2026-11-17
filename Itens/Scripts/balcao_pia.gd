extends BrilhoAoToque

@export var Tabua : Marker2D = null

const COPO : String = "Copo"

const FRIGIDEIRA : String = "Frigideira"

const PENEIRA : String = "Peneira"

var Frigideira : InterageMouse = null

var Copo : InterageMouse = null

var Peneira : InterageMouse = null

var tweenPos : Tween = null

func _process(_delta: float) -> void:
	#faça com que aqui tenha uma instrução que crie o copo de óleo
	#desenhe o sprite da frigideira sem óleo
	#e desenhe o sprite da peneira suja
	pass

func playerColidindo(_area : Area2D):
	if _area is InterageMouse:
		if _area.name == COPO and _area.get_node("Sprite2D").frame == 0:
			Copo = _area
			colocaNaTabua(Copo)
			return
		elif _area.name == PENEIRA:
			Peneira = _area
			colocaNaTabua(Peneira)
			return
		elif _area.name == FRIGIDEIRA and _area.get_node("Sprite2D").frame == 2:
			Frigideira = _area
			colocaNaTabua(Frigideira)


	
	verificacao(_area)
	if not jogador: return
	Sprite.frame = 1

func colocaNaTabua(_objeto : InterageMouse):
	if tweenPos: tweenPos.kill()
	tweenPos = create_tween().bind_node(self)
	tweenPos.tween_property(_objeto, "global_position", Tabua.global_position, 0.25).set_ease(Tween.EASE_OUT)
