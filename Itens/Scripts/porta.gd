extends Area2D

@export var QuitPopup : CanvasLayer

@export var SomPorta : EfeitoSom

var podeMostrarPopup : bool = true

func _ready():
	area_entered.connect(areaEntered)

func areaEntered(_area : Area2D):

	if _area.get_parent() is Player and podeMostrarPopup:

		_area.get_parent().position.y += 20

		SomPorta.rodaSom()

		QuitPopup.aparecer()

		podeMostrarPopup = false

	await get_tree().create_timer(1).timeout

	podeMostrarPopup = true

	
	
