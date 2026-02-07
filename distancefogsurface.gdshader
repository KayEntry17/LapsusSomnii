shader_type spatial;
//render_mode unshaded;
//render_mode blend_premul_alpha;
uniform sampler2D depth_texture : hint_depth_texture;
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;
uniform vec3 color: source_color;
uniform float max;
uniform float mult;
void vertex() {

}

void fragment() {
	float depth = texture(depth_texture, SCREEN_UV).x;
	vec3 ndc;
	if (CURRENT_RENDERER == RENDERER_COMPATIBILITY)
		ndc = vec3(SCREEN_UV, depth) * 2.0 - 1.0;
	else
		ndc = vec3(SCREEN_UV * 2.0 - 1.0, depth);
	vec4 view = INV_PROJECTION_MATRIX * vec4(ndc, 1.0);
  	view.xyz /= view.w;
  	float linear_depth = -view.z+VERTEX.z;
	float coeff=min(-(max-linear_depth*mult)/max,1.);
	ALBEDO=mix(texture(screen_texture,SCREEN_UV).rgb,color,max(coeff,0.2));
	//ALPHA=1.-coeff;
	ROUGHNESS=0.5;
	SPECULAR=1.;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
