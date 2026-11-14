extends CharacterBody2D
class_name EnterageMouse

@export var Area : Area2D = null

func _ready() -> void:
    Area.mouse_entered.connect(mouseColidindo)
    Area.mouse_exited.connect(mouseNaoColidindo)

func mouseColidindo():
    pass

func mouseNaoColidindo():
    pass
