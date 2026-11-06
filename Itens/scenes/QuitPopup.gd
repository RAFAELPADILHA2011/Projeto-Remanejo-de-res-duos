extends CanvasLayer

@export var popup : Node2D

@export var Fundo : ColorRect

@export var botaoSair : TextureButton

@export var botaoVoltar : TextureButton

const SEC : float = 0.15

const NORMAL_POS : float = 0

const BAIXO_POS : float = 12

const MAX_TRANSPARENCIA : float = 0.6

var tween : Tween = null

var possoPrecionar : bool = false

func _ready():
	popup.modulate = Color.TRANSPARENT
	botaoSair.button_down.connect(sairPrecionado)
	botaoVoltar.button_down.connect(voltarPrecionado)

func aparecer():
	if tween: tween.kill()
	tween = create_tween().bind_node(popup).set_parallel()
	tween.tween_property(popup, "position:y", NORMAL_POS, SEC)
	tween.tween_property(popup, "modulate", Color.WHITE, SEC)
	tween.tween_property(Fundo, "material:shader_parameter:transparencia_flash", MAX_TRANSPARENCIA, SEC)
	await tween.finished
	possoPrecionar = true

func voltarPrecionado():
	if not possoPrecionar: return
	if tween: tween.kill()
	tween = create_tween().bind_node(popup).set_parallel()
	tween.tween_property(popup, "position:y", BAIXO_POS, SEC)
	tween.tween_property(popup, "modulate", Color.TRANSPARENT, SEC)
	await tween.finished
	possoPrecionar = false

func sairPrecionado():
	if not possoPrecionar: return
	get_tree().quit()
