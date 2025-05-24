//Velocidades
velocity_base = 0;
velocity = velocity_base;
speedx = 0;
speedy = 0;

//Armas
weapon_present = noone;
weapon_equip = noone;

enum States { IDLE, MOVE }
state = States.IDLE;

// Direções
enum Directions { FRONT, BACK, LEFT, RIGHT }
direction = Directions.FRONT;

//Sprite por direção
spr_front = noone;
spr_back = noone;
spr_left = noone;
spr_right = noone;

//Frames por direção
//FRONT, BACK, LEFT, RIGHT 
//					 F  B  L  R
img_idle_start = [0, 0, 0, 0];  
img_idle_end   = [0, 0, 0, 0];

img_walk_start = [0, 0, 0, 0];
img_walk_end   = [0, 0, 0, 0];

//Sprite atual
spr_present = spr_front;
sprite_index = spr_present;