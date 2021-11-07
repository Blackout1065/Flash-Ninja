/// @description Make the animation start from frame

if (last_sprite != sprite_index) {
	image_index = 0;
	last_sprite = sprite_index;
}

//Hurtbox follows the player
with(hurtbox){
	x = other.x + xOffset;
	y = other.y + yOffset;
}

//Hitbox
if(hitbox != -1){
	with(hitbox){
		
		//Follow the player
		x = other.x + xOffset;
		y = other.y + yOffset;
		
		//Transparency
		image_alpha = (global.show_boxes) ? .5 : 0;
		
		//Collision check
		with(oHurtbox){
			if(place_meeting(x, y, other) && other.owner != owner){
				
				//Check if you need to ignore the collision
				with(other){
					
					//Check if target is on the ignore list
					//If it is, don't hit them
					for(i=0; i<ds_list_size(ignoreList); i++){
						if(ignoreList[| i] == other.owner){
							ignore = true;
							break;
						}
					}
					
					//If it is not on the ignore list,
					//hit it then add it to the ignore list
					if(!ignore){
						other.owner.hit = true;
						other.owner.hitBy = id;
						ds_list_add(ignoreList, other.owner);
					}
				}
			}
		}
		
	}
}
