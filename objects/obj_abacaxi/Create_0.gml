// Inherit the parent event
event_inherited();

//Velocidades
velocity_base = 12;
velocity = velocity_base;
speedx = 0;
speedy = 0;

//Sprite por direção
spr_front = spr_abacaxi_front;
spr_back = spr_abacaxi_back;
spr_left = spr_abacaxi_left;
spr_right = spr_abacaxi_right;

//Frames por direção
//FRONT, BACK, LEFT, RIGHT 
//					 F  B  L  R
img_idle_start = [0, 0, 0, 0];  
img_idle_end   = [0, 0, 0, 0];

img_walk_start = [1, 1, 1, 1];
img_walk_end   = [7, 7, 7, 7];

sprite_index = spr_front;