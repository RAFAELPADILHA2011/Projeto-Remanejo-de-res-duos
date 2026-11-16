extends Area2D

@export var Sprite : Sprite2D = null

const TEMPO : float = 0.5

const MAX_ALTURA : float = -5.0

const GRAV : float = 0.25

var possoSerComido : bool = true

var tweenComido : Tween = null

var player : Player = null

var velZ : float = MAX_ALTURA

var z : float = -1

func _ready() -> void:
	mouse_entered.connect(colidindoMouse)
	mouse_exited.connect(naoColidindoMouse)

func _process(_delta: float) -> void:
	if z >= 0:
		z = 0
		velZ = 0

	else:

		velZ += GRAV

	z += velZ

	Sprite.offset.y = z

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		tweenSendoComido()

func tweenSendoComido():
	z = -1
	velZ = MAX_ALTURA
	if tweenComido: tweenComido.kill()
	tweenComido = create_tween().bind_node(self)
	tweenComido.tween_property(self, "global_position", player.global_position, TEMPO)
	player.animacao("comendo")
	await player.Anim.animation_finished
	queue_free()

func colidindoMouse():
	Sprite.frame = 1
	possoSerComido = true

func naoColidindoMouse():
	Sprite.frame = 0
	possoSerComido = false
