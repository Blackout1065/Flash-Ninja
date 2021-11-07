/// @description Movement Logic

// Calculate Movement
// Since keyboard_check returns 1 or 0, you can subtract key_right and key_left
// So that you get a different number if either is pressed, but 0 if both are pressed
var move = key_right - key_left;


//Gravity Logic
vsp += grv;

//Variable that checks if player is on the floor
onFloor = place_meeting(x,y+1,oWall);

//Variable that checks if player is against the wall


// ジャンプ！
if(key_jump && jump<maxjump-1){
	vsp = -6;
	jump++;
}

if(onFloor) jump = 0;



// Horizontal Collision
// Parameters of place_meeting: (x-coordinate, y-coordinate, thing focus object is colliding with)
if(place_meeting(x+hsp,y,oWall)){
	// The sign function returns 1 if the given variable is positive and -1 if its negative
	while(!place_meeting(x+sign(hsp),y,oWall)){
		x += sign(hsp);
	}
	
	hsp = 0;
}

x += hsp;


// Vertical Collision
if(place_meeting(x,y+vsp,oWall)){
	while(!place_meeting(x,y+sign(vsp),oWall)){
		y += sign(vsp);
	}
	vsp = 0;
}


y += vsp;


//______________________Animations______________________
//Flip the direction sprite is facing depending on which way they move
if(hsp!=0) image_xscale = sign(hsp)*.25;
facing = sign(image_xscale);

image_speed = 1;

//Use the appropriate animation based on the state
switch(state){
	case states.airthrow:
		sprite_index = sPlayerAirThrow;
		break;
		
	case states.throwing:
		sprite_index = sPlayerThrow;
		break;
		
	case states.airattack:
		sprite_index = sPlayerAirAttack;
		break;
		
	case states.attacking:
		sprite_index = sPlayerAttack;
		break;
		
	case states.airborne:
		sprite_index = (sign(vsp) > 0) ? sPlayerJumpUp : sPlayerJumpDown;
		break;
		
	case states.slide:
		sprite_index = sPlayerSlide;
		break;
		
	case states.grounded:
		sprite_index = (hsp==0) ? sPlayerIdle : sPlayerRun;
		break;
}


//Declare the criteria for the different states
if(!onFloor){
	if(state == states.airborne){
		if(key_throw) state = states.airthrow;
		else if(key_attack) state = states.airattack;
	}
	
	else if(state != states.airthrow && state != states.airattack) state = states.airborne;
}
else if(onFloor && key_down && hsp!=0) {
	if(first_down) hsp += move*3;
	state = states.slide;
}

else if(state == states.grounded){
	if(key_throw) state = states.throwing;
	else if(key_attack) state = states.attacking;
}

else if(state != states.throwing && state != states.attacking && (!key_down || move==0)) state = states.grounded;



//Slide physics
if(state == states.slide){
	if(abs(hsp)!=0) hsp -= sign(hsp)*fr;
}
else{
	hsp = move * walksp;
}


//Hurtboxes
if(state == states.slide){
	
	//Hurtbox for when you slide to the left
	if(hsp<0){
		hurtbox = slide_left_hurtbox;
		slide_right_hurtbox.image_alpha = 0;
	}
	
	//Hurtbox for when you slide to the right
	else if(hsp>0){
		hurtbox = slide_right_hurtbox;
		slide_left_hurtbox.image_alpha = 0;
	}
	
	main_hurtbox.image_alpha = 0;
}
else{
	hurtbox = main_hurtbox
	slide_left_hurtbox.image_alpha = 0;
	slide_right_hurtbox.image_alpha = 0;
}


//Hitboxes
if((state == states.attacking || state == states.airattack) && image_index == 4){
	hitbox = hitbox_create(facing*60, 90, facing*30, -40, 4, facing*6, -2, 20, 2);
}

if(state == states.slide && abs(hsp)>4){
	if(hitbox!=-1) instance_destroy(hitbox);
	hitbox = hitbox_create(facing*10, 10, facing*50, 40, 1, facing*6, -6, 20, 0);
}
	












