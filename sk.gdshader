shader_type sky;
render_mode disable_fog;
uniform sampler2D sky1;
void sky() {
	COLOR=texture(sky1,SKY_COORDS).xyz;
}
