extends CanvasLayer

@export var PopupSair : Node2D

@export var botaoSair : Button

@export var botaoVoltar : Button

const SEC : float = 0.15

const NORMAL_POS : float = 0

const DOWN_POS : float = 12

var tween : Tween = null

var possoPrecionar : bool = false

func _ready():
	botaoSair.button_down.connect(sairPrecionado)
	botaoVoltar.button_down.connect(voltarPrecionado)

func aparecer():
	if tween: tween.kill()
	tween = create_tween().bind_node(PopupSair).set_parallel()
	tween.tween_property(PopupSair, "position:y", NORMAL_POS, SEC)
	tween.tween_property(PopupSair, "modulate", Color.WHITE, SEC)
	await tween.finished
	possoPrecionar = true

func voltarPrecionado():
	if not possoPrecionar: return
	if tween: tween.kill()
	tween = create_tween().bind_node(PopupSair).set_parallel()
	tween.tween_property(PopupSair, "position:y", DOWN_POS, SEC)
	tween.tween_property(PopupSair, "modulate", Color.TRANSPARENT, SEC)
	await tween.finished
	possoPrecionar = false

func sairPrecionado():
	if not possoPrecionar: return
	get_tree().quit()
