extends EnteragePlayer

@export var Sprite : Sprite2D

func playerColidindo(_area : Area2D):
    verificacao(_area)
    Sprite.frame = 1

func playerNaoColidindo(_area : Area2D):
    verificacao(_area)
    Sprite.frame = 0