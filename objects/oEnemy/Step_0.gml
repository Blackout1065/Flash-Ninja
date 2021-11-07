/// @description Movement Logic

// Calculate Movement
// Since keyboard_check returns 1 or 0, you can subtract key_right and key_left
// So that you get a different number if either is pressed, but 0 if both are pressed


	

	//Variable that checks if player is on the floor
	onFloor = place_meeting(x,y+1,oWall);
	


	// ジャンプ！
	/*
	if(onFloor){
		vsp = -4;
	}
	*/


	//Gravity Logic
	vsp += grv;




	// Horizontal Collision
	// Parameters of place_meeting: (x-coordinate, y-coordinate, thing focus object is colliding with)
	if(place_meeting(x+hsp,y,oWall)){
		
	// The sign function returns 1 if the given variable is positive and -1 if its negative
	while(!place_meeting(x+sign(hsp),y,oWall)){
			x += sign(hsp);
		}
	
		
		hsp = -hsp;
		x +=  hsp;
	}

	x +=  hsp;


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
if(hsp!=0 && eState != enemyStates.hurt) image_xscale = sign(hsp)*.25;
	image_speed = 1;

	//Use the appropriate animation based on the state
	switch(eState){
		case enemyStates.airborne:
			sprite_index = (sign(vsp) > 0) ? sEnemyJumpUp : sEnemyJumpDown;
			break;
		
		case enemyStates.grounded:
			sprite_index = (hsp==0) ? sEnemyIdle : sEnemyRun;
			break;
			
		case enemyStates.hurt:
			sprite_index = sEnemyHit;
			break;
	}


	//Declare the criteria for the different states
	if(!onFloor && eState != enemyStates.hurt){
		eState = enemyStates.airborne;
	}
	else if(eState != enemyStates.hurt) eState = enemyStates.grounded;
	
	
	//Hurt logic
	if(eState == enemyStates.hurt){
		stun--;
		hsp -= sign(hsp)*.2;
		if(stun<=0){
			hsp = walksp;
			eState = enemyStates.grounded;
		}
	}
	
	
	
	
	


