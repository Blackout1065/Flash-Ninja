// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hitbox_create(xscale, yscale, offsetX=0, offsetY=0, duration, xforce=0, yforce=0, stun, damage){
	_hitbox = instance_create_layer(x, y, "Boxes", oHitbox);
	_hitbox.owner = id;
	_hitbox.image_xscale = xscale;
	_hitbox.image_yscale = yscale;
	_hitbox.yOffset = offsetY;
	_hitbox.xOffset = offsetX;
	_hitbox.life = duration;
	_hitbox.xHit = xforce;
	_hitbox.yHit = yforce;
	_hitbox.hitStun = stun;
	_hitbox.dmg = damage;
	
	return _hitbox;
}