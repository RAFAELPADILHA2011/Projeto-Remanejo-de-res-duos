extends CharacterBody2D
class_name EnteragePlayer

@export var Area : Area2D = null

var jogador : Player = null

func _ready() -> void:
    Area.area_entered.connect(playerColidindo)
    Area.area_exited.connect(playerNaoColidindo)

func playerColidindo(_area : Area2D):
    pass

func playerNaoColidindo(_area : Area2D):
    pass

func verificacao(_area : Area2D):
    if not (_area.get_parent() is Player): return
    jogador = _area.get_parent()