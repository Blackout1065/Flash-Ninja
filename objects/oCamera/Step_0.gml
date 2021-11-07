/// @description Update Camera

//Update destination
if(instance_exists(follow)){
	xTo = follow.x;
	yTo = follow.y;
}

//Update object position
x += (xTo - x)/25; //(x/y)To - (x/y) is the distance between the (x/y) distination and the current (x/y)
y += (yTo - y)/25; //The 25 makes the camera go slowly rather than snapping to the player's location

//Update camera postion
camera_set_view_pos(cam, x-view_w_half, y-view_h_half);