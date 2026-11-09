extends Area2D

@export var QuitPopup : CanvasLayer

var podeMostrarPopup : bool = true

func _ready():
	area_entered.connect(areaEntered)

func areaEntered(_area : Area2D):

	if _area.get_parent() is Player and podeMostrarPopup:

		QuitPopup.aparecer()

		podeMostrarPopup = false

	await get_tree().create_timer(1).timeout

	podeMostrarPopup = true

	
	
