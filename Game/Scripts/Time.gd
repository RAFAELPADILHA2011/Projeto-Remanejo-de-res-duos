extends WorldEnvironment

@export var dirLuz : DirectionalLight2D

@export var Tempo : CanvasModulate

const VOLTA_INTEIRA : float = TAU

const TEMPO : float = 500

const MEIO_TEMPO : float = TEMPO/2

const DIA_TEMPO : Color = Color.WHITE

const NOITE_TEMPO : Color = Color(0.529, 0.294, 0.529)

const MIN_BRILHO : float = 0.25

const MAX_BRILHO : float = 0.5

var tweenLuz : Tween = null

var tweenTempo

func _ready():
    rotacionandoLuz()
    mudaTempo()

func rotacionandoLuz():
    if tweenLuz: tweenLuz.kill()
    tweenLuz = create_tween().bind_node(self).set_loops()
    tweenLuz.tween_property(dirLuz, "rotation", VOLTA_INTEIRA, TEMPO)
    tweenLuz.tween_property(dirLuz, "rotation", -VOLTA_INTEIRA, 0)

func mudaTempo():
    if tweenTempo: tweenTempo.kill()
    tweenTempo = create_tween().bind_node(self).set_loops()
    tweenTempo.tween_property(Tempo, "color", NOITE_TEMPO, MEIO_TEMPO)
    tweenTempo.parallel().tween_property(self, "environment:tonemap_exposure", MIN_BRILHO, MEIO_TEMPO)
    tweenTempo.tween_property(Tempo, "color", DIA_TEMPO, MEIO_TEMPO)
    tweenTempo.parallel().tween_property(self, "environment:tonemap_exposure", MAX_BRILHO, MEIO_TEMPO)