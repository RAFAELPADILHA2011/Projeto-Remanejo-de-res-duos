extends Node
class_name Dialogos

const ICONE_PLAYER : String = "res://Itens/Sprites/Sprite-PlayerImagem.png"

const ICONE_GUIA : String = "res://Itens/Sprites/Sprite-GuiaImagem.png"

const DIALOGO1 : Dictionary = {

    0 : {
        "icone": ICONE_GUIA,
        "nome" : "Guia",
        "dialogo" : "Olá! serei o responsável que lhe ensinará a reaproveitar essas garrafas de óleo surradas.\n(Precione 'Enter ou Espaço para continuar')"
    },

    1 : {
        "icone": ICONE_PLAYER,
        "nome" : "Você",
        "dialogo" : "blz então..."
    }
}
