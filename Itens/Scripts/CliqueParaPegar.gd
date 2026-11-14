extends EnterageMouse

@export var Mensagem : Label = null

@export var PosYOriginal : float = -42

@export var PosYOEscondida : float = -35

const TEMPO : float = 0.1

const COR_ORIGINAL : Color = Color.WHITE

const COR_ESCONDIDA : Color = Color(0.145, 0.086, 0.31, 0.0)

var tweenPrecionar : Tween = null

var necessitaExibirTexto : bool = true

func _on_input_event(_viewport: Node, _event: InputEvent, _shape_idx: int) -> void:
	if _event is InputEventMouseButton and _event.pressed:
		if _event.event == MOUSE_BUTTON_LEFT:
			queue_free()

func mouseColidindo():
	if not necessitaExibirTexto: return
	if tweenPrecionar: tweenPrecionar.kill()
	tweenPrecionar = create_tween().bind_node(self)
	tweenPrecionar.tween_property(Mensagem, "position:y", PosYOriginal, TEMPO)
	tweenPrecionar.tween_property(Mensagem, "modulate", COR_ORIGINAL, TEMPO)

func mouseNaoColidindo():
	if tweenPrecionar: tweenPrecionar.kill()
	tweenPrecionar = create_tween().bind_node(self)
	tweenPrecionar.tween_property(Mensagem, "position:y", PosYOEscondida, TEMPO)
	tweenPrecionar.tween_property(Mensagem, "modulate", COR_ESCONDIDA, TEMPO)
