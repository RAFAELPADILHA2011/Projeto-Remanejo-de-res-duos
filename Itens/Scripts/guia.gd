extends CharacterBody2D

@export var Area : Area2D = null

@export var Mensagem : Label = null

@export var DialogoTela : PackedScene = null

const TEMPO : float = 0.1

const POS_Y_ORIGINAL : float = -40

const POS_Y_ESCONDIDO : float = -35

const COR_ORIGINAL : Color = Color.WHITE

const COR_ESCONDIDA : Color = Color(0.145, 0.086, 0.31, 0.0)

var dialogo : TelaDialogo = null

var tweenPrecionar : Tween = null

var possoComecarDialogo : bool = false

func _ready():
    Area.area_entered.connect(playerColidindo)
    Area.area_exited.connect(playerNaoColidindo)

func _process(_delta: float):
    if Input.is_physical_key_pressed(KEY_E) and possoComecarDialogo:
        possoComecarDialogo = false
        dialogo = DialogoTela.instantiate()
        add_child(dialogo)
        dialogo.dados = Dialogos.DIALOGO1
        dialogo.entrandoEmTela()


func playerColidindo(_area : Area2D):
    if _area.get_parent() is Player:
        if tweenPrecionar: tweenPrecionar.kill()
        tweenPrecionar = create_tween().bind_node(self)
        tweenPrecionar.tween_property(Mensagem, "position:y", POS_Y_ORIGINAL, TEMPO)
        tweenPrecionar.tween_property(Mensagem, "modulate", COR_ORIGINAL, TEMPO)
        await tweenPrecionar.finished
        possoComecarDialogo = true

func playerNaoColidindo(_area : Area2D):
    if _area.get_parent() is Player: 
        if tweenPrecionar: tweenPrecionar.kill()
        tweenPrecionar = create_tween().bind_node(self)
        tweenPrecionar.tween_property(Mensagem, "position:y", POS_Y_ESCONDIDO, TEMPO)
        tweenPrecionar.tween_property(Mensagem, "modulate", COR_ESCONDIDA, TEMPO)
        await tweenPrecionar.finished
        possoComecarDialogo = false