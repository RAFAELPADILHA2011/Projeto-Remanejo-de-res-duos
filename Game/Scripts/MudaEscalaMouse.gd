extends TextureButton

const MAX_ESCALA : Vector2 = Vector2(1.3, 1.3)

const NORMAL_ESCALA : Vector2 = Vector2.ONE

const TEMPO : float = 0.25

var tweenEscala : Tween = null

func _ready() -> void:
    focus_mode = Control.FOCUS_NONE
    mouse_entered.connect(aumenta)
    mouse_exited.connect(diminui)

func aumenta():
    if tweenEscala: tweenEscala.kill()
    tweenEscala = create_tween().bind_node(self)
    tweenEscala.tween_property(self, "scale", MAX_ESCALA, TEMPO)

func diminui():
    if tweenEscala: tweenEscala.kill()
    tweenEscala = create_tween().bind_node(self)
    tweenEscala.tween_property(self, "scale", NORMAL_ESCALA, TEMPO)