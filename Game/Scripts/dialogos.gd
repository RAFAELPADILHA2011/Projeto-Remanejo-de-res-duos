extends Node

const ICONE_PLAYER : String = "res://Itens/Sprites/Sprite-PlayerImagem.png"

const ICONE_GUIA : String = "res://Itens/Sprites/Sprite-GuiaImagem.png"

const DIALOGO0 : Dictionary = {

	0 : {
		"icone": ICONE_PLAYER,
		"nome" : "Você",
		"dialogo" : "... Olá?"
	},

	1 : {
		"icone": ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "..."
	}
,
	2 : {
		"icone": ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "(Olhe para instrução em cima de sua cabeça)"
	}
}

const DIALOGO1 : Dictionary = {

	0 : {
		"icone": ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "Oh... você pretende fazer ovos fritos?"
	},

	1 : {
		"icone": ICONE_PLAYER,
		"nome" : "Você :3",
		"dialogo" : "Sim."
	},

	2 : {
		"icone": ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "Bom, você pode pegar aquela frigideira em cima da tábua no balcão esquerdo, e coloca-la no fogão, para fritar os ovos."
	},

	3 : {
		"icone": ICONE_PLAYER,
		"nome" : "Você",
		"dialogo" : "Valeu..."
	},

	4 : {
		"icone": ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "Lembre-se que você pode pegar itens ao passar o mouse em cima deles."
	}
}

const DIALOGO2 : Dictionary = {

	0 : {
		"icone": ICONE_PLAYER,
		"nome" : "Você",
		"dialogo" : "Tenho a frigideira em mãos... como ponho no fogão agora?"
	},

	1 : {
		"icone": ICONE_GUIA,
		"nome" : "Guia (aparentemente chocado)",
		"dialogo" : "Apenas clique com o mouse em cima da frigideira que deve estar dentro de seu inventário, e esteja perto do fogão."
	},

}

const DIALOGO3 : Dictionary = {

		0 : {
		"icone": ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "Que tal por os ovos fritos na mesa?"
	}
}

const DIALOGO4 : Dictionary = {

	0 : {
		"icone": ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "Bom apetite..."
	},

	1 : {
		"icone": ICONE_PLAYER,
		"nome" : "Você",
		"dialogo" : "Você não vai comer?"
	},

		2 : {
		"icone": ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "Não, obrigado."
	},

}

func escolhaDialogo(_dialogo : int) -> Dictionary:
	return get("DIALOGO" + str(_dialogo))
