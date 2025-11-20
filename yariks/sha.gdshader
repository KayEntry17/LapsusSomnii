shader_type canvas_item;
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;
uniform vec4 col1:source_color;
uniform vec4 col2:source_color;
uniform vec4 col3:source_color;
uniform vec4 col4:source_color;
uniform float margin;
uniform vec4 scol1:source_color;
void vertex() {
	
}
bool approx(vec4 cols1, vec4 cols2){
	if ((abs(cols1.r-cols2.r)<margin) && (abs(cols1.g-cols2.g)<margin) && (abs(cols1.b-cols2.b)<margin)){
		return true;
	}
	else{
		return false;
	}
	
}
void fragment() {
	if (approx(texture(screen_texture,SCREEN_UV),col4)){
		COLOR=scol1;
	}
	if (approx(texture(screen_texture,SCREEN_UV),scol1)){
		COLOR=col4;
	}
	if (approx(texture(screen_texture,SCREEN_UV),col4)){
		COLOR=scol1;
	}
	if (approx(texture(screen_texture,SCREEN_UV),col1)){
		COLOR=col3;
	}
	if (approx(texture(screen_texture,SCREEN_UV),col3)){
		COLOR=col1;
	}
	//COLOR=texture(screen_texture,SCREEN_UV);
	;
	
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
