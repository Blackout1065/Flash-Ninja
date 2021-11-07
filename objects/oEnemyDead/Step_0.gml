/// @description Insert description here
// You can write your code in this editor

onFloor = place_meeting(x,y+1,oWall);
vsp += grv;


if(place_meeting(x,y+vsp,oWall)){
		while(!place_meeting(x, y+sign(vsp), oWall)){
			y += sign(vsp);
		}
		vsp = 0;
	}

y += vsp;