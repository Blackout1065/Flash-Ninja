/// @description Insert description here
// You can write your code in this editor
draw_self();

//For 3 frames, flash white then return to normal
if(flash > 0){
	flash--;
	shader_set(shWhite);
	draw_self();
	shader_reset();
}
