	shader_type canvas_item;

uniform float progresso : hint_range(0.0, 1.0, 0.05);

uniform float suavidade : hint_range(0.0, 1.0, 0.1);

uniform bool inverter = false;

void fragment() {
	
	float diagonal = (UV.x + UV.y) * 0.5;
	
	float maximo = progresso * (1.0 + suavidade);
	float minimo = maximo - suavidade;
	
	float mascara = smoothstep(minimo, minimo, diagonal);
	
	if (inverter){
		mascara = 1.0 - mascara;
	}
	
	COLOR.a *= mascara;
}
	