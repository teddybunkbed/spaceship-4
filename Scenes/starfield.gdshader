shader_type spatial;
render_mode unshaded;

uniform sampler2D noise: repeat_enable;
uniform float star_scale = 0.1;

varying vec3 world_pos;

void vertex() {
	world_pos = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;
}

void fragment() {
	ALBEDO = vec3(0.0, 0.0, 0.0);
	float n = texture(noise, world_pos.xz * star_scale).r;
	float star = step(0.85, n);
	ALBEDO = vec3(star);
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
