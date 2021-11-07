/// @description Insert description here
// You can write your code in this editor

//"other" within the with parameter returns the id of the specific oEnemy the kunai hits
with(other){
	hp--;
	lasthsp = hsp;
	flash = 3;
	eState = enemyStates.hurt;
	stun = 10
}

instance_destroy();