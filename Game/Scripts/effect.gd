extends Sprite2D

const MAX_ALTURA : float = 2.8

const MIN_ALTURA : float = 1.2

const TEMPO : float = 2

var tweenAltura : Tween = null

func _ready():
    if tweenAltura: tweenAltura.kill()
    tweenAltura = create_tween().bind_node(self).set_loops()
    tweenAltura.tween_property(self, "scale:y", MIN_ALTURA, TEMPO)
    tweenAltura.tween_property(self, "scale:y", MAX_ALTURA, TEMPO)
   