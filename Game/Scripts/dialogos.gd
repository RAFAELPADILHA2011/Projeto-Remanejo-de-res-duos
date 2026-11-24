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
		"dialogo" : "Já que estamos aqui, e por coincidência do destino nós temos um 1L aí nessa frigideira encardida, vamos fazer sabonete."
	},

	7 : {
		"icone" : ICONE_PLAYER,
		"nome" : "Você",
		"dialogo" : "Oxi sabonete?... do que você chamou a frigideira mesm-"
	},

	8 : {
		"icone" : ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "Bom, vou te explicando de pouco em pouco, mas por agora pegue um copo, uma peneira e a frigideira que você acabou de usar e filtre o óleo no balcão"
	}
}

const DIALOGO7 : Dictionary = {
	0 : {
		"icone" : ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "filtre o óleo da panela."
	}
}

const DIALOGO8 : Dictionary = {

	0 : {
		"icone" : ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "Bom, agora que você filtrou o óleo. vamos preparar a soda cáustica para fazer o sabão."
	},

	1 : {
		"icone" : ICONE_PLAYER,
		"nome" : "Você",
		"dialogo" : "Soda cáustica... isso não é meio perigoso?"
	},

	2 : {
		"icone" : ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "Calma aí, já vamos chegar nessa parte, por enquanto apenas pegue a chaleira e encha ela com água."
	},
}

const DIALOGO9 : Dictionary = {

	0 : {
		"icone" : ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "Bom, agora que você encheu a chaleira com água, leve-a para o fogão e deixe amornar."
	},

	1 : { 
		"icone" : ICONE_PLAYER,
		"nome" : "Você",
		"dialogo" : "Beleza..."
	},

	2 : {
		"icone" : ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "Após deixar a água morna, lembre-se de colocar uns 260ml dela em um copo. \n (Você pode fazer isso no balcão)."
	},

	3 : {
		"icone" : ICONE_PLAYER,
		"nome" : "Você",
		"dialogo" : "OK, chefe."
	}
}

const DIALOGO10 : Dictionary = {
	0 : {
		"icone" : ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "Pelo menos se lembrou de por os 260ml de água no copo?"
	},

	1 : {
		"icone" : ICONE_PLAYER,
		"nome" : "Você",
		"dialogo" : "a."
	}
}

const DIALOGO11 : Dictionary = {

	0 : {
		"icone" : ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "Com a água morna em mãos, agora vem a parte mais perigosa..."
	},

	1 : {
		"icone" : ICONE_PLAYER,
		"nome" : "Você",
		"dialogo" : "A soda cáustica?"
	},

	2 : {
		"icone" : ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "Sim..."
	},

	3 : {
		"icone" : ICONE_PLAYER,
		"nome" : "Você",
		"dialogo" : "Aí que medo."
	},

	4 : {
		"icone" : ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "Calma não é para tanto."
	},

	5 : {
		"icone" : ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "É só você pegar os equipamentos de proteção, e não terá problemas. Mas ainda assim tome cuidado."
	},

	6 : {
		"icone" : ICONE_PLAYER,
		"nome" : "Você",
		"dialogo" : "E quais são os equipamentos de segurança?"
	},

	7 : {
		"icone" : ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "Luvas grossas e óculos de proteção."
	},

	8 : {
		"icone" : ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "O ideal seria você usar uma blusa ou camiseta de manga longa, calças grossas e até mascara, mas como tu é um bicho esquisito e não um humano, use só os 2 primeiros que eu falei."
	},
	
	9 : {
		"icone" : ICONE_PLAYER,
		"nome" : "Você",
		"dialogo" : "precisava me chamar assim... poxa. Mas beleza né?"
	},

	10 : {
		"icone" : ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "OK. Me desculpa meu conterrâneo, mas tirando isso após pegar a soda, pegue uma colher e um copo e adicione 150g da soda no copo."
	},

	11 : {
		"icone" : ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "(Você pode fazer isso no balcão)."
	}
}

const DIALOGO12 : Dictionary = {
	0 : {
		"icone" : ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "agora que você tem dois copos, um com soda e um com água morna. pegue sua colher a vá dissolvendo a soda aos poucos na água."
	},

	1 : {
		"icone" : ICONE_GUIA,
		"nome" : "Guia",
		"dialogo" : "E PELO AMOR DE DEUS, nunque misture a água na soda, senão sua próxima estação será a sala de hospital."
	},

	2 : {
		"icone" : ICONE_PLAYER,
		"nome" : "Você",
		"dialogo" : "medo..."
	}
}

func escolhaDialogo(_dialogo : int) -> Dictionary:
	return get("DIALOGO" + str(_dialogo))
