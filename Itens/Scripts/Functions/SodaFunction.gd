extends FunctionItem
class_name SodaFuncao

const NORMAL_COR : Color = Color.WHITE

const DISABELITADO_COR : Color = Color.GRAY

@onready var LuvaBotao : TextureButton = null

@onready var OculosBotao : TextureButton = null

func entrar():
	for botao in Global.InventarioItems.inventario as Array[TextureButton]:
		if botao.get_children() != []:
			if botao.get_child(0) is LuvaFuncao: LuvaBotao = botao
			elif botao.get_child(0) is OculosFuncao: OculosBotao = botao
	if not LuvaBotao and not OculosBotao:
		push_error("primeiramente como voce pegou isso?")
		return
	LuvaBotao.disabled = true
	OculosBotao.disabled = true
	LuvaBotao.modulate = DISABELITADO_COR
	OculosBotao.modulate = DISABELITADO_COR

func sair():
	for botao in Global.InventarioItems.inventario as Array[TextureButton]:
		if botao.get_children() != []:
			if botao.get_child(0) is LuvaFuncao: LuvaBotao = botao
			elif botao.get_child(0) is OculosFuncao: OculosBotao = botao
	if not LuvaBotao and not OculosBotao:
		push_error("primeiramente como voce pegou isso?")
		return
	LuvaBotao.disabled = false
	OculosBotao.disabled = false
	LuvaBotao.modulate = NORMAL_COR
	OculosBotao.modulate = NORMAL_COR
	LuvaBotao = null
	OculosBotao = null
