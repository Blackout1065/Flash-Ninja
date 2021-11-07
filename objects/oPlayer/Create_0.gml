/// @description Starting values
hsp = 0;				//Horizontal Speed
vsp = 0;				// Vertical Speed
grv = 0.2;				//Gravity
walksp = 6;				//Walk Speed (constant)
fr = walksp/40;		//Friction
jump = 0;
maxjump = 2;

enum states {grounded, airborne, throwing, attacking, airthrow, airattack, slide, hurt, dead};

state = states.grounded;

last_sprite = 0;

firingDelay = 0;

//Hurtboxes
main_hurtbox = hurtbox_create(55, 110, -28, -60);
slide_right_hurtbox =  hurtbox_create(90, 75, -25, -20);
slide_left_hurtbox =  hurtbox_create(90, 75, -60, -20);
hurtbox = main_hurtbox;

//Hitbox
hitbox = -1;

//Hitbox showing
global.show_boxes = false;

