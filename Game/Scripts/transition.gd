extends CanvasLayer
class_name Transition
@export var Anim : AnimationPlayer

func rodaTransicao(_anim : StringName):
    if _anim != Anim.current_animation:
        Anim.current_animation = _anim
    Anim.play(Anim.current_animation)
    