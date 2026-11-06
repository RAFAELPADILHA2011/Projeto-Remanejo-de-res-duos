shader_type canvas_item;

uniform sampler2D TEXTURA_TELA : hint_screen_texture, filter_linear_mipmap;
uniform float intencidade_borrao : hint_range(0.0, 5.0) = 1.5;

uniform vec4 flash_cor : source_color;
uniform float valor_flash : hint_range(0.0, 1.0, 0.1);
uniform float transparencia_flash : hint_range(0.0, 1.0) = 1.0;


void fragment() {
	vec4 resultado_borrao = textureLod(TEXTURA_TELA, SCREEN_UV, intencidade_borrao);
	vec4 textura_cor = texture(TEXTURE, UV);
	textura_cor.a *= transparencia_flash;
	vec4 cor_base = vec4(resultado_borrao.rgb, textura_cor.a);
	COLOR = mix(cor_base, flash_cor, valor_flash);
	COLOR.a = textura_cor.a;
}