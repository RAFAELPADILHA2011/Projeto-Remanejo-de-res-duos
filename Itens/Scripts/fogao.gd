extends BrilhoAoToque

@export var Boca1 : Marker2D = null

@export var Boca2 : Marker2D = null

const FRIGIDEIRA : String = "Frigideira"

const OVOS : String = "Ovos"

const CHALEIRA : String = ""

var _boca_disponivel : Marker2D = null

var tweenPos : Tween = null

var Frigideira : InterageMouse = null

func playerColidindo(_area : Area2D):
	if _area is InterageMouse:
		if _area.name == FRIGIDEIRA and _area.get_node("Sprite2D").frame == 0:
			Frigideira = _area
			await achaBocaDisponivel(_area)
		elif _area.name == OVOS:
			if Frigideira:
				_area.queue_free()
				Frigideira.get_node("Sprite2D").frame = 1
				Frigideira.corte = Rect2(21.0, 0.0, 21.0, 0.0)
				Global.PROGRESSAO = 3

	verificacao(_area)
	if not jogador: return
	Sprite.frame = 1

func achaBocaDisponivel(_interage_mouse : InterageMouse):
	if Boca1.get_children() != [] and Boca2.get_children() != []: return
	if Boca1.get_children() == []: _boca_disponivel = Boca1
	else: _boca_disponivel = Boca2
	if tweenPos: tweenPos.kill()
	tweenPos = create_tween().bind_node(self)
	tweenPos.tween_property(_interage_mouse, "global_position", _boca_disponivel.global_position, 0.25).set_ease(Tween.EASE_OUT)
	await tweenPos.finished
