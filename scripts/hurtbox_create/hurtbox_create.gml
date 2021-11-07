// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hurtbox_create(xscale, yscale, offsetX=0, offsetY=0){
	_hurtbox = instance_create_layer(x, y, "Boxes", oHurtbox);
	_hurtbox.owner = id;
	_hurtbox.image_xscale = xscale;
	_hurtbox.image_yscale = yscale;
	_hurtbox.yOffset = offsetY;
	_hurtbox.xOffset = offsetX;
	
	return _hurtbox;
}
