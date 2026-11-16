extends EnteragePlayer
class_name BrilhoAoToque

@export var Sprite : Sprite2D

func playerColidindo(_area : Area2D):
	verificacao(_area)
	if not jogador: return
	Sprite.frame = 1

func playerNaoColidindo(_area : Area2D):
	verificacao(_area)
	Sprite.frame = 0
