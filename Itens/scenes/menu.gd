extends CanvasLayer

@export var ParticulaBolhas : GPUParticles2D

@export var Titulo : Sprite2D

const TEMPO : float = 1

var tweenTitulo : Tween = null

func _ready():
	ParticulaBolhas.emitting = true
	flutuandoTitulo()

func flutuandoTitulo():
	if tweenTitulo: tweenTitulo.kill()
	tweenTitulo = create_tween().bind_node(self).set_loops()
	tweenTitulo.tween_property(Titulo, "offset:y", PI, TEMPO)
	tweenTitulo.tween_property(Titulo, "offset:y", -PI, TEMPO)
	
