shader_type spatial;
render_mode unshaded;
uniform sampler2D screen_texturedither2: filter_nearest,repeat_enable;
void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	ALBEDO=texture(screen_texturedither2,SCREEN_UV).xyz;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
