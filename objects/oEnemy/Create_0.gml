/// Starting Values
vsp = 0;
grv = 0.165;
walksp = (random(4) > 2) ? 4 : 0;
hsp = walksp;

enum enemyStates {grounded, airborne, throwing, attacking, airthrow, airattack, hurt};

eState = enemyStates.grounded;

hp = 10; //How many hits to kill
flash = 0; //How long the hitflash lasts
dead = false;

hurtbox = hurtbox_create(65, 105, -32, -50);

hit = false;
hitBy = -1;