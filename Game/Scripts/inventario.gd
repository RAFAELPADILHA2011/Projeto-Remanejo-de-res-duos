extends Sprite2D

@export var player : Player = null

@export var guardadorItems : Node2D = null

var inventario : Array[TextureButton] = []

var _botao : TextureButton = null

var _atlas : AtlasTexture = null

var _item : InterageMouse = null

var _slot_atual : int = 0

var _itemFuncition : FunctionItem = null

func _ready() -> void:
	Global.InventarioItems = self
	for _node in range(get_child_count()):
		_botao = get_child(_node) as TextureButton
		if _botao == null:
			push_error("meu irmão deu errado, os filhos desse nó não existem ou não são textureButtons")
			return
		inventario.append(_botao)
		_botao.button_down.connect(removeItem.bind(_node))
		if not Global.itemPegado.is_connected(adicionarItem): Global.itemPegado.connect(adicionarItem)
		_botao = null

@warning_ignore("shadowed_variable")
func adicionarItem(_texture : Texture2D, _item : InterageMouse, _corte : Rect2, _funcao : FunctionItem):
	for _slot : TextureButton in get_children():
		if _slot.texture_normal == null:
			_atlas = AtlasTexture.new()
			_atlas.atlas = _texture
			_atlas.region = _corte
			_slot.texture_normal = _atlas
			if not _funcao: break
			_slot.add_child(_funcao.duplicate())
			_funcao.entrar()
			break

func removeItem(_indice : int):
	_botao = get_child(_indice)
	if _botao.texture_normal == null: return
	if _botao.get_children() != []:
		_itemFuncition = _botao.get_child(0) as FunctionItem
		_itemFuncition.sair()
		_itemFuncition.call_deferred("queue_free")
	_item = Global.inventario[_indice].item
	_item.global_position = player.global_position
	guardadorItems.add_child(_item)
	_item.aparecer()
	Global.inventario.remove_at(_indice)
	_botao.texture_normal = null
	_botao = null
	_item = null
	_itemFuncition = null
	organizaInventario(_indice)

func organizaInventario(_indice : int):
	for _i in get_child_count():
		if _indice + _i < Global.MAX_ITEMS: _slot_atual = _indice + _i 
		else: break
		if inventario[_slot_atual].texture_normal == null: continue
		inventario[_slot_atual - 1].texture_normal = inventario[_slot_atual].texture_normal
		if inventario[_slot_atual].disabled == true and inventario[_slot_atual].modulate != Color.WHITE:
			inventario[_slot_atual].disabled = false
			inventario[_slot_atual - 1].disabled = true
			inventario[_slot_atual - 1].modulate = inventario[_slot_atual].modulate
			inventario[_slot_atual].modulate = Color.WHITE
		if inventario[_slot_atual].get_children() != []:
			_itemFuncition = inventario[_slot_atual].get_child(0)
			inventario[_slot_atual - 1].add_child(_itemFuncition.duplicate())
			_itemFuncition.queue_free()
			_itemFuncition = null
		inventario[_slot_atual].texture_normal = null
