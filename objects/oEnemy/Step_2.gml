/// @description Insert description here
// You can write your code in this editor

//Hurtbox follows the player
with(hurtbox){
	x = other.x + xOffset;
	y = other.y + yOffset;
}

//Got hit
if(hit){
	hp -= hitBy.dmg;
	hsp = hitBy.xHit;
	vsp = hitBy.yHit;
	stun = hitBy.hitStun;
	hit = false;
	flash = 3;
	eState = enemyStates.hurt;
}



