shader_type canvas_item;
uniform float speed;
uniform float power;
uniform float radius;
uniform sampler2D nt2: filter_nearest,repeat_enable;
uniform sampler2D nt: filter_nearest,repeat_enable;

uniform float offset;
void vertex() {
	//float rad=(VERTEX.x-offset)/(radius-VERTEX.y);
	//VERTEX.x=cos(rad)*(radius-VERTEX.y);
	//VERTEX.x/y=sin(rad)*(radius-VERTEX.y);
	//
	//VERTEX.y+=sin(VERTEX.x+VERTEX.y+TIME*speed)*100.*power;
	float rad=(VERTEX.x-offset)/(radius);
	rad=max(-2.*PI,rad);
	rad=min(2.*PI,rad);
	VERTEX.x=cos(rad)*(radius-VERTEX.y);
	VERTEX.y=sin(rad)*(radius-VERTEX.y);
	VERTEX+=(texture(nt,VERTEX+TIME*speed).x-0.5)*power;
	
	
}

void fragment() {
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
