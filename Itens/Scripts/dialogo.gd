extends CanvasLayer
class_name TelaDialogo

@export_category("Objetos")

@export var Nome : Label = null

@export var Dialogo : RichTextLabel = null

@export var Icone : Sprite2D = null

@export var Anim : AnimationPlayer = null

const MAX_TEXTO_VISIVEL : float = 1

const QTD_CARACTERE : int = 1

const MIN_PASSO_TEXTO : float = 0.01

const MAX_PASSO_TEXTO : float = 0.05

var passoTexto : float = MAX_PASSO_TEXTO

var id : int = 0

var dados : Dictionary = {}

var emTela : bool = false

func _process(_delta: float):
	if not emTela: return
	if get_tree().paused == true:
			Anim.play("saida")
			await Anim.animation_finished
			queue_free()
	if Input.is_action_pressed("ui_accept") and Dialogo.visible_ratio < MAX_TEXTO_VISIVEL:
		passoTexto = MIN_PASSO_TEXTO
		return

	passoTexto = MAX_PASSO_TEXTO

	if Input.is_action_just_pressed("ui_accept"):
		if (id + 1) == dados.size():
			Anim.play("saida")
			await Anim.animation_finished
			queue_free()
			return
		id += 1
		inicializandoDialogo()

func entrandoEmTela():
	Anim.play("entrada")
	await Anim.animation_finished
	inicializandoDialogo()
	emTela = true

func inicializandoDialogo():
	Nome.text = dados[id]["nome"]
	Dialogo.text = dados[id]["dialogo"]
	Icone.texture = load(dados[id]["icone"])

	Dialogo.visible_characters = 0

	while Dialogo.visible_ratio < MAX_TEXTO_VISIVEL:
		await get_tree().create_timer(passoTexto).timeout
		Dialogo.visible_characters += QTD_CARACTERE
