extends TextureButton

const MAX_X : float = -10

const NORMAL_X : float = 0

const TEMPO : float = 0.1

var tweenX : Tween = null

func _ready():
    mouse_entered.connect(mouseColidindo)
    mouse_exited.connect(mouseNaoColidindo)

func mouseColidindo():
    if tweenX: tweenX.kill()
    tweenX = create_tween().bind_node(self)
    tweenX.tween_property(self, "pivot_offset:x", MAX_X, TEMPO)

func mouseNaoColidindo():
    if tweenX: tweenX.kill()
    tweenX = create_tween().bind_node(self)
    tweenX.tween_property(self, "pivot_offset:x", NORMAL_X, TEMPO)