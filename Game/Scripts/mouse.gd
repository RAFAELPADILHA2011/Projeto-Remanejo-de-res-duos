extends Sprite2D

var dt : float = 0



func _process(delta: float) -> void:
    dt = delta * 60
    global_position = lerp(global_position, get_global_mouse_position(), 0.5 * dt)
    if Global.tenhoLuva:
        frame = 0
        return
    frame = 1