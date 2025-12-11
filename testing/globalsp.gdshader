shader_type spatial;
varying vec3 world_coords;
stencil_mode write, compare_always, 15;
render_mode unshaded;
uniform float offset;
uniform float scale =1.0;
void vertex()
{
  world_coords = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;
}

void fragment() {
	ALBEDO = vec3(pow((world_coords.y/scale+offset),3));

	}


//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
