/// @description Movement Keys & Kunai Throw

// Keyboard Check checks every frame for if the key is held (continuous input)
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));

// Keyboard Pressed only checks once (single input)
key_jump = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));

key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
first_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));

key_attack = keyboard_check_pressed(ord("J"));
key_throw = keyboard_check_pressed(ord("K"));



firingDelay -= 1;

if((state == states.throwing || state = states.airthrow) && firingDelay < 0){
	
	firingDelay = 20; //frames of delay
	
	//Instance_create_layer creates an object Param 4 at (Param1, Param2) on layer Param3
	//It returns the id of the newly created object but can be used on its own
	with (instance_create_layer(x,y,"Kunai",oKunai)){
		
		//Sizing
		image_xscale = .3;
		image_yscale = .3;
		
		
		direction = sign(other.image_xscale);
		
		//speed is mainly used over x and y coordinate manipulation if the objects motion is simple/linear
		speed = 15*sign(other.image_xscale); //pixels per frame * -1 or 1 for direction
		image_angle = direction*-90;
	}
}

hurtbox.image_alpha = (global.show_boxes) ? .5 : 0;

