extends Node

signal itemPegado(_image : Texture2D, _item : InterageMouse, _corte : Rect2, _funcao : FunctionItem)

const MAX_ITEMS : int = 7

var PROGRESSAO : int = 0

var inventario : Array[Dictionary] = []

var InventarioItems : Sprite2D = null

var tenhoLuva : bool = false

var tenhoOculos : bool = false

func _ready() -> void:
	itemPegado.connect(ItemPego)

func ItemPego(_image : Texture2D, _item : InterageMouse, _corte : Rect2, _funcao : FunctionItem = null):
	if inventario.size() >= MAX_ITEMS: return

	if _item.get_parent(): _item.get_parent().remove_child(_item)

	inventario.append({
		"item" : _item,
		"image": _image,
		"corte": _corte,
		"funcao": _funcao
	})
