
//Owner used for comparison
owner = -1;

//Positioning the box
xOffset = 0;
yOffset = 0;

//Duration of hitbox
life = 0;

//Horizontal and Vertical force of hitbox
xHit = 0;
yHit = 0;

//Determine if something has been hit more than once
ignore = false;
ignoreList = ds_list_create();

//Duration that victim is in stun for
hitStun = 60;

//Damage
dmg = 0;
