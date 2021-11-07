/// @description Different events to preform after a certain animation is done

//Pause animation on last frame
if(sprite_index == sPlayerJumpUp || sprite_index == sPlayerJumpDown || sprite_index == sPlayerSlide){
	image_index = image_number - 1;
	image_speed = 0;
}


//Return to base state after animation is over
if(sprite_index == sPlayerThrow || sprite_index == sPlayerAttack) state = states.grounded;
if(sprite_index == sPlayerAirThrow || sprite_index == sPlayerAirAttack) state = states.airborne;

