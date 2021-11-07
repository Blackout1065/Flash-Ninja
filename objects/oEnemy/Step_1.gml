/// @description Insert description here
// You can write your code in this editor

if(hp <= 0){
	
	with(hurtbox){
		instance_destroy();
	}
	
	with(instance_create_layer(x,y,layer,oEnemyDead)){
		image_xscale = other.image_xscale;
	}
	
	instance_destroy();
}

else hurtbox.image_alpha = (global.show_boxes) ? .5 : 0;