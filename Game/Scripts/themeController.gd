extends AudioStreamPlayer
class_name ThemeController

@export var ThemeMenu : AudioStream = null

@export var ThemeGame : AudioStream = null 

const TEMPO : float = 0.5

var tweenVolume : Tween = null

var volumeAtual : float = 0.0

func tocaMusica(_musica : AudioStream):
	if stream == null:
		stream = _musica
		aumentaVolume()
		return
	if stream != _musica:
		await diminuiVolume()
		stream = _musica
		aumentaVolume()
	

func diminuiVolume():
	if stream == null: return
	volumeAtual = db_to_linear(volume_db)
	if tweenVolume: tweenVolume.kill()
	tweenVolume = create_tween().bind_node(self)
	tweenVolume.tween_method(mudaVolume, volumeAtual, 0.0, TEMPO)
	tweenVolume.tween_callback(stop)
	await tweenVolume.finished

func aumentaVolume():
	if stream == null: return
	volume_db = linear_to_db(0.0)
	play()
	if tweenVolume: tweenVolume.kill()
	tweenVolume = create_tween().bind_node(self)
	tweenVolume.tween_method(mudaVolume, 0.0, 1.0, TEMPO)

func mudaVolume(_valor : float):
	volume_db = linear_to_db(_valor)
