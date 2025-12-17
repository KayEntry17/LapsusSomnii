shader_type canvas_item;
uniform float speed;
uniform float power;
uniform sampler2D nt: filter_nearest,repeat_enable;
render_mode world_vertex_coords;
void vertex() {
	//vec2 v_clip_position = (PROJECTION_MATRIX * WORLD_MATRIX * vec4(v_local_position, 0.0, 1.0)).xy;
	//VERTEX+=texture(nt, UV+TIME*speed).rg*power;
	//VERTEX.y+=sin(VERTEX.x+TIME*speed)*power;
	//VERTEX.x+=cos(VERTEX.y+TIME*speed)*power;
	//VERTEX+=(texture(nt, UV+TIME*speed).rg-0.5)*power;
	VERTEX.y+=sin(VERTEX.x+TIME*speed)*power;
	VERTEX.x+=cos(VERTEX.y+TIME*speed)*power;

}

//void fragment() {

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
