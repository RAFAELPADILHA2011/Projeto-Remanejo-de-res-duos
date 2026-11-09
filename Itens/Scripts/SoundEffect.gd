extends AudioStreamPlayer
class_name EfeitoSom

@export var AlteracaoPitch : float = 0.1

@export var AlteracaoVolume : float = 0.05

var pitchAtual : float = 0

var VolumeAtual : float = 0

func rodaSom():
    pitchAtual = randf() * AlteracaoPitch
    VolumeAtual = randf() * AlteracaoVolume
    pitch_scale = 1.0 + pitchAtual
    volume_db = 0 + VolumeAtual
    play()