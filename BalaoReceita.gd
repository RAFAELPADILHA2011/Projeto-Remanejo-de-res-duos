extends CharacterBody2D

@export var Receitas : Sprite2D = null

@export var Anim : AnimationPlayer

const RECEITAS : Dictionary = {
    "ovo_frito" : 0,
    "copo_oleo" : 2,
    "chaleira_agua" : 6,
    "chaleira_morna" : 7,
    "copo_agua" : 4,
    "copo_soda" : 1,
    "copo_agua_soda" : 3,
    "copo_alcool" : 5,
    "pet_oleo_soda" : 8,
    "pet_sabonete_resto" : 9,
    "pote_sacola" : 10,
    "pote_sabao" : 11
}

func entrar(_receita : int):
    Anim.play("entrada")
    Receitas.frame = _receita

func sair():
    Anim.play("saida")