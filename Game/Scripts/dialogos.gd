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
	},

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
		"nome" : "Guia",
		"dialogo" : "Apenas clique com o mouse em cima da frigideira que deve estar dentro de seu inventário, e esteja perto do fogão."
	},
}

const DIALOGO3 : Dictionary = {
	0 : {
		"icone" : ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "Bom, você não pode fazer um ovo frito, sem ovo, certo? caso esteja em duvida, eles estão ao balcão a direita"
	},

	1 : {
		"icone" : ICONE_PLAYER,
		"nome" : "Você",
		"dialogo" : "Bah..."
	}
}

const DIALOGO4 : Dictionary = {

		0 : {
		"icone": ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "Que tal por os ovos fritos na mesa?"
	}
}

const DIALOGO5 : Dictionary = {

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

const DIALOGO6 : Dictionary = {

	0 : {
		"icone" : ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "Bom agora que você satisfeito o que vai fazer com o óleo que sobrou na frigideira?"
	},

	1 : {
		"icone" : ICONE_PLAYER,
		"nome" : "Você",
		"dialogo" : "É... é...\n Jogar na pi-"
	},

	2 : {
		"icone" : ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "NÃO! você quer entupir a pia e ainda poluir ainda mais o meio ambiente!"
	},

	3 : {
		"icone" : ICONE_PLAYER,
		"nome" : "Você",
		"dialogo" : "..."
	},

	4 : {
		"icone" : ICONE_PLAYER,
		"nome" : "Você",
		"dialogo" : "OK... Mas o que eu posso fazer com ele?"
	},

	5 : {
		"icone" : ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "Bom, o normal seria filtrar o óleo frio e por em garrafas pet vedadas, e levar a um posto de tratamento, mas esse não é o próposito desse jogo, certo?"
	},

	6 : {
		"icone" : ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "Já que estamos aqui, vamos fazer sabonete."
	},

	7 : {
		"icone" : ICONE_PLAYER,
		"nome" : "Você",
		"dialogo" : "Sabonete?"
	},

	8 : {
		"icone" : ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "Bom, vou te explicando de pouco em pouco, mas por agora pegue um copo, uma peneira e a frigideira que você acabou de usar e filtre o óleo no balcão"
	}
}

func escolhaDialogo(_dialogo : int) -> Dictionary:
	return get("DIALOGO" + str(_dialogo))
