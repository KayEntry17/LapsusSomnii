shader_type canvas_item;
uniform float threshold;
void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	if (COLOR.g+COLOR.r+COLOR.b<threshold){
		COLOR.a=0.;}
		
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
