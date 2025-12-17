shader_type canvas_item;
uniform float speed;
uniform float power;
uniform sampler2D nt: filter_nearest,repeat_enable;
void vertex() {
	VERTEX.y+=sin(VERTEX.x+TIME*speed)*power;
	VERTEX.x+=cos(VERTEX.x+TIME*speed)*power;
	//VERTEX+=texture(nt, VERTEX+TIME*speed).rg*power;
}

//void fragment() {
	//COLOR=vec4(UV,1,1);
//}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
