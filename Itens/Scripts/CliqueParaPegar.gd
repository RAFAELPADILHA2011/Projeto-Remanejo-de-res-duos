extends Area2D
class_name InterageMouse

@export_category("Item Caracteriscas")

@export var corte : Rect2 = Rect2()

@export var funcao : FunctionItem = null

@export_category("Item Efeito")

@export var Mensagem : Label = null

@export var PosYOriginal : float = -42

@export var PosYOEscondida : float = -35

const TEMPO : float = 0.1

const COR_ORIGINAL : Color = Color.WHITE

const COR_ESCONDIDA : Color = Color(0.145, 0.086, 0.31, 0.0)

var tweenPrecionar : Tween = null

var necessitaExibirTexto : bool = true

func _ready() -> void:
	mouse_entered.connect(mouseColidindo)
	mouse_exited.connect(mouseNaoColidindo)

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if Global.inventario.size() == Global.MAX_ITEMS: return 
		if not verificacao(): return
		Global.itemPegado.emit($Sprite2D.texture, extraindoMeuCaminho(), corte, funcao)
		queue_free()

func verificacao() -> bool:
	return true

func extraindoMeuCaminho() -> String:
	var caminho : String = scene_file_path
	if caminho.is_empty():
		push_error("caminho vazio")
		return ""
	return caminho

func mouseColidindo():
	if not necessitaExibirTexto: return
	if tweenPrecionar: tweenPrecionar.kill()
	tweenPrecionar = create_tween().bind_node(self)
	tweenPrecionar.tween_property(Mensagem, "position:y", PosYOriginal, TEMPO)
	tweenPrecionar.tween_property(Mensagem, "modulate", COR_ORIGINAL, TEMPO)
	await tweenPrecionar.finished

func mouseNaoColidindo():
	if tweenPrecionar: tweenPrecionar.kill()
	tweenPrecionar = create_tween().bind_node(self)
	tweenPrecionar.tween_property(Mensagem, "position:y", PosYOEscondida, TEMPO)
	tweenPrecionar.tween_property(Mensagem, "modulate", COR_ESCONDIDA, TEMPO)
