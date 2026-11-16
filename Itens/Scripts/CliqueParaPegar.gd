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

const TEMPO_LONGO : float = 0.3

const COR_ORIGINAL : Color = Color.WHITE

const COR_ESCONDIDA : Color = Color(0.145, 0.086, 0.31, 0.0)

var tweenPrecionar : Tween = null

var tweenSomeAparece : Tween = null

var necessitaExibirTexto : bool = true

var _brilho : PointLight2D = null

var _texturaBrilho : Texture2D = null

var _gradienteBrilho : Gradient = null

func _ready() -> void:
	geraBrilho()
	mouse_entered.connect(mouseColidindo)
	mouse_exited.connect(mouseNaoColidindo)

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if Global.inventario.size() == Global.MAX_ITEMS: return 
		if not verificacao(): return
		await sumir()
		Global.itemPegado.emit($Sprite2D.texture, self, corte, funcao)
		mouseNaoColidindo()
		
func verificacao() -> bool:
	return true

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

func aparecer():
	if tweenSomeAparece: tweenSomeAparece.kill()
	tweenSomeAparece = create_tween().bind_node(self)
	tweenSomeAparece.tween_property(self, "modulate", COR_ORIGINAL, TEMPO_LONGO)

func sumir():
	if tweenSomeAparece: tweenSomeAparece.kill()
	tweenSomeAparece = create_tween().bind_node(self)
	tweenSomeAparece.tween_property(self, "modulate", COR_ESCONDIDA, TEMPO_LONGO)
	await tweenSomeAparece.finished

func geraBrilho():
	_gradienteBrilho = Gradient.new()
	_gradienteBrilho.colors = PackedColorArray([
		Color.WHITE,
		Color.TRANSPARENT
	])
	_gradienteBrilho.offsets = PackedFloat32Array([0.0, 1.0])

	_texturaBrilho = GradientTexture2D.new()
	_texturaBrilho.gradient = _gradienteBrilho
	_texturaBrilho.width = 32
	_texturaBrilho.height = 32
	_texturaBrilho.fill = GradientTexture2D.FILL_RADIAL
	_texturaBrilho.fill_from = Vector2(0.5, 0.5)
	_texturaBrilho.fill_to = Vector2(0.5, 0.0)

	_brilho = PointLight2D.new()
	_brilho.texture = _texturaBrilho
	_brilho.color = Color(1.0, 1.0, 0.529, 0.796)
	_brilho.energy = 1.0
	add_child(_brilho)