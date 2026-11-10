extends CharacterBody2D

class_name Player

@export var Anim : AnimationPlayer

@export var Sprite : Sprite2D

@export var SomAndar : EfeitoSom

const VEL : float = 300

const ACEL : float = 0.3

const DESA : float = 0.2

const MAX_TEMPOPASSO : float = 0.5

const DIMINUIDOR_TEMPO : float = 0.025

var dir : Vector2 = Vector2.ZERO

var dt : float = 0.0

var tempoPasso : float = 0.0

func _process(_delta : float):
	move(_delta)
	move_and_slide()

func move(_delta : float):

	dt = _delta * 60

	dir = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down"))

	if dir != Vector2.ZERO:

		velocity = lerp(velocity, (dir.normalized() * VEL * dt), ACEL)

		spritePos(dir)

	else:

		velocity = lerp(velocity, (dir.normalized() * VEL * dt), DESA)

	rodaSomAndar()

func animacao(_nome : StringName):
	if _nome != Anim.current_animation: Anim.current_animation = _nome
	Anim.play(Anim.current_animation)

func spritePos(_dir : Vector2):

	if _dir.x != 0:

		animacao("lado")

		Sprite.flip_h = false if _dir.x > 0 else true

		return

	elif _dir.y > 0:

		animacao("baixo")

		return

	animacao("cima")
	
func rodaSomAndar():
	if dir == Vector2.ZERO:
		tempoPasso = MAX_TEMPOPASSO
		return
	tempoPasso -= DIMINUIDOR_TEMPO
	if tempoPasso <= 0: 
		tempoPasso = MAX_TEMPOPASSO
		SomAndar.rodaSom()

	
