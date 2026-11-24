extends InterageMouse

const MSG_NORMAL : String = ":Soda Cáustica (Em escamas):\nPrecisa de Luvas e Óculos"

const MSG_COM_LUVA : String = ":Soda Cáustica (Em escamas):\nPrecisa de Óculos"

const MSG_COM_OCULOS : String = ":Soda Cáustica (Em escamas):\nPrecisa de Luvas"

const MSG_LIBERADO : String = ":Soda Cáustica (Em escamas):"

#chaves ref
const COR_PRERIGO : Color = Color.RED

const COR_SEMI_PRERIGO : Color = Color(1.0, 0.5, 0.5)

const COR_SEGURO : Color = Color.WHITE

func _process(_delta: float) -> void:
    if not Global.tenhoLuva and not Global.tenhoOculos:
        Mensagem.text = MSG_NORMAL
        Mensagem.set("theme_override_colors/font_color", COR_PRERIGO)
        return
    elif Global.tenhoLuva and not Global.tenhoOculos:
        Mensagem.text = MSG_COM_LUVA
        Mensagem.set("theme_override_colors/font_color", COR_SEMI_PRERIGO)
        return
    elif Global.tenhoOculos and not Global.tenhoLuva:
        Mensagem.text = MSG_COM_OCULOS
        Mensagem.set("theme_override_colors/font_color", COR_SEMI_PRERIGO)
        return
    Mensagem.text = MSG_LIBERADO
    Mensagem.set("theme_override_colors/font_color", COR_SEGURO)

func verificacao() -> bool:
    return Global.tenhoLuva and Global.tenhoOculos