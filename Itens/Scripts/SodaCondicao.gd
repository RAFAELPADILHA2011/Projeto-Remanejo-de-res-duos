extends InterageMouse

@export var Aviso : Label = null

const MSG_NORMAL : String = ":Soda Cáustica:\nPrecisa de Luvas e Óculos"

const MSG_COM_LUVA : String = ":Soda Cáustica:\nPrecisa de Óculos"

const MSG_COM_OCULOS : String = ":Soda Cáustica:\nPrecisa de Luvas"

const MSG_LIBERADO : String = ":Soda Cáustica:"

#chaves ref
const COR_PRERIGO : Color = Color.RED

const COR_SEMI_PRERIGO : Color = Color(1.0, 0.5, 0.5)

const COR_SEGURO : Color = Color.WHITE

func _process(_delta: float) -> void:
    if not Global.tenhoLuva and not Global.tenhoOculos:
        Aviso.text = MSG_NORMAL
        Aviso.set("theme_override_colors/font_color", COR_PRERIGO)
        return
    elif Global.tenhoLuva and not Global.tenhoOculos:
        Aviso.text = MSG_COM_LUVA
        Aviso.set("theme_override_colors/font_color", COR_SEMI_PRERIGO)
        return
    elif Global.tenhoOculos and not Global.tenhoLuva:
        Aviso.text = MSG_COM_OCULOS
        Aviso.set("theme_override_colors/font_color", COR_SEMI_PRERIGO)
        return
    Aviso.text = MSG_LIBERADO
    Aviso.set("theme_override_colors/font_color", COR_SEGURO)

func verificacao() -> bool:
    return Global.tenhoLuva and Global.tenhoOculos