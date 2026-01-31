shader_type canvas_item;


instance uniform vec4 objectColor; 

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	if (COLOR.a > 0.1){
	  COLOR = objectColor;
}

}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
