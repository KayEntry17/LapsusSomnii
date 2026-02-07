shader_type canvas_item;
uniform sampler2D papert;
uniform float scale;
void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 floatpr=(vec2(1.)/SCREEN_PIXEL_SIZE)/vec2(textureSize(papert,0));
	float alpha=COLOR.a;
	COLOR.a=alpha*texture(papert,SCREEN_UV*floatpr*scale).r;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
