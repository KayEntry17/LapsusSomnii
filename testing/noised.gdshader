shader_type canvas_item;
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;
uniform sampler2D screen_texturedither: filter_nearest,repeat_enable;
uniform sampler2D screen_texturedither2: filter_nearest,repeat_enable;
uniform vec4 col1:source_color;
uniform vec4 col2:source_color;
uniform float brightness=0.;
uniform float dithersp=0.;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	//vec2 texs=vec2(textureSize(screen_texturedither,0));
	float dithersp1=dithersp/100.;
	vec2 screennorm=vec2(textureSize(TEXTURE,0));
	//vec2 scp=SCREEN_PIXEL_SIZE;
	//scp=vec2(1./scp.r,1./scp.g);
	vec2 scuv=UV;
	//vec2 scuv=vec2((SCREEN_UV.x/UV.x)*fract(UV.x),(SCREEN_UV.y/UV.y)*fract(UV.y));
	vec2 res=vec2(640,360);
	vec2 trscuv=floor(SCREEN_UV*res)/res;
	scuv=scuv*screennorm;
	scuv=mod(scuv,vec2(1));
	vec3 ogc=texture(screen_texture,trscuv).rgb;
	ogc=vec3(ogc.r+ogc.g+ogc.b)/3.;
	vec4 colog=(texture(screen_texturedither,vec2(trscuv.x+TIME*dithersp1,trscuv.y-TIME*dithersp1))+texture(screen_texturedither2,vec2(trscuv.x-0.3*TIME*dithersp1,trscuv.y+0.5*TIME*dithersp1)))/2.;
	if (colog.r-(brightness/100.)>ogc.r){
		COLOR=col2;}
	else{

		COLOR=col1;}

	//COLOR=vec4(res,0.,1.);
	//COLOR=colog;
	//vec2 screennorm=vec2(SCREEN_UV.x,SCREEN_UV.y*(scp.g/scp.r));
	////screennorm=SCREEN_UV*vec2(textureSize(screen_texturedither,0)*scale);
	//vec2 texs=vec2(textureSize(screen_texturedither,0));
	//float size=float(scale)*(res.y/texs.y);
	//COLOR=texture(screen_texturedither,screennorm*size);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
