extends CanvasLayer

@export_category("Elementos")

@export var TransitionScene : Transition

@export var Mundo : Node2D

@export var Anim : AnimationPlayer

@export var BrilhoInferior : TextureRect

@export var Titulo : Sprite2D

@export var ContainerBotoes : Node2D

@export_category("Botões")

@export var Comecar : Button

@export var Opcoes : Button

@export var Sair : Button

const TEMPO : float = 1

const TEMPO_LONGO : float = 1.5

const COR1 : Color = Color(0.822, 0.051, 0.316)

const COR2 : Color = Color(0.187, 0.0, 0.584)

const MAX_ALTURA : float = 1.2

const MIN_ALTURA : float = 0.5

var tweenTitulo : Tween = null

var tweenBotoes : Tween = null

var tweenBrilhoInferior : Tween = null

var tweenAlturaBrilho : Tween = null

var alturaBotoes : float = 0

func _ready():

	flutuandoTitulo()
	flutuandoBotoes()
	mudaBrilhoCor()
	mudaAlturaBrilho()

	Comecar.connect("button_down", comecarPresionado)
	Opcoes.connect("button_down", opcoesPresionado)
	Sair.connect("button_down", sairPresionado)

func _process(_delta: float) -> void:
	ContainerBotoes.position.y += alturaBotoes

func comecarPresionado():
	Anim.play("saida")
	await Anim.animation_finished
	TransitionScene.rodaTransicao("entrada")
	await TransitionScene.Anim.animation_finished
	visible = false
	TransitionScene.rodaTransicao("saida")
	Mundo.process_mode = Node.PROCESS_MODE_INHERIT

func opcoesPresionado():
	pass

func retornarMenu():
	TransitionScene.rodaTransicao("entrada")
	await TransitionScene.Anim.animation_finished
	Mundo.process_mode = Node.PROCESS_MODE_PAUSABLE
	visible = true
	TransitionScene.rodaTransicao("saida")
	Anim.play("entrada")

func sairPresionado():
	Anim.play("saida")
	await Anim.animation_finished
	TransitionScene.rodaTransicao("entrada")
	await TransitionScene.Anim.animation_finished
	get_tree().quit()

func flutuandoTitulo():
	if tweenTitulo: tweenTitulo.kill()
	tweenTitulo = create_tween().bind_node(self).set_loops()
	tweenTitulo.tween_property(Titulo, "offset:y", PI, TEMPO)
	tweenTitulo.tween_property(Titulo, "offset:y", -PI, TEMPO)

func flutuandoBotoes():
	if tweenBotoes: tweenBotoes.kill()
	tweenBotoes = create_tween().bind_node(self).set_loops()
	tweenBotoes.tween_property(self, "alturaBotoes", PI/4, TEMPO_LONGO)
	tweenBotoes.tween_property(self, "alturaBotoes", -PI/4, TEMPO_LONGO)

func mudaBrilhoCor():
	if tweenBrilhoInferior: tweenBrilhoInferior.kill()
	tweenBrilhoInferior = create_tween().bind_node(self).set_loops()
	tweenBrilhoInferior.tween_property(BrilhoInferior, "modulate", COR1, TEMPO)
	tweenBrilhoInferior.tween_property(BrilhoInferior, "modulate", COR2, TEMPO)

func mudaAlturaBrilho():
	if tweenAlturaBrilho: tweenAlturaBrilho.kill()
	tweenAlturaBrilho = create_tween().bind_node(self).set_loops()
	tweenAlturaBrilho.tween_property(BrilhoInferior, "scale:y", MIN_ALTURA, TEMPO)
	tweenAlturaBrilho.tween_property(BrilhoInferior, "scale:y", MAX_ALTURA, TEMPO)
