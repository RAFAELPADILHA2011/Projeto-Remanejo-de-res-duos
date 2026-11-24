extends BrilhoAoToque

@export var Pia : Marker2D = null

const CHALEIRA : String = "Chaleira"

var Chaleira : InterageMouse = null

var tweenPos : Tween = null

func playerColidindo(_area : Area2D):
	if _area is InterageMouse:
		if _area.name == CHALEIRA and _area.get_node("Sprite2D") and not Chaleira:
			Chaleira = _area
			await colocaNaPia(Chaleira)
			Chaleira.get_node("Sprite2D").frame = 1
			Chaleira.corte = Rect2(15.0, 0.0, 15.0, 0.0)
			Global.PROGRESSAO = 9
			Chaleira = null
			return

	verificacao(_area)
	if not jogador: return
	Sprite.frame = 1

func colocaNaPia(_objeto : InterageMouse):
	if tweenPos: tweenPos.kill()
	tweenPos = create_tween().bind_node(self)
	tweenPos.tween_property(_objeto, "global_position", Pia.global_position, 0.25).set_ease(Tween.EASE_OUT)
	await tweenPos.finished
