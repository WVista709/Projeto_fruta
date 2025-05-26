//Velocidades
velocity_base = 0;
velocity = velocity_base;
speedx = 0;
speedy = 0;

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

//Inventario
max_weapons = 2;
weapons_guarded = 0;
weapon_inventory = [];
current_weapon_index = 0;
weapon_equipped = noone;

function Weapon_inventory() {
	//Atualizando a visibilidade da arma
	for (var i = 0; i < array_length(weapon_inventory); i++) {
		var _w = weapon_inventory[i];
		weapon_equipped = weapon_inventory[current_weapon_index];
		if (instance_exists(_w)) _w.visible = (i == current_weapon_index);
	}
	
	// Troca de arma no inventario
	if (keyboard_check_pressed(ord("E"))) {
		if (array_length(weapon_inventory) > 0) {
			current_weapon_index = (current_weapon_index + 1) mod array_length(weapon_inventory);
			weapon_equipped = weapon_inventory[current_weapon_index];
		}
	}
	
	//Criando um range para poder trocar a arma
	var _pickup_range = 80;
	var _closest_weapon = noone;
	var _min_dist = _pickup_range;
	
	with (obj_weapon_father){
		if (!weapon_in_inventory){
			var _d = point_distance(other.x, other.y, x, y);
			
			if (_d < _min_dist){
				_min_dist = _d;
				_closest_weapon = id;
			}
		}
	}
	
	//Trocando a arma no chão
	if (keyboard_check_pressed(ord("Q")) && _closest_weapon != noone){
		if (array_length(weapon_inventory) > 0) {
			//Jogando a arma antiga
			var _old_weapon = weapon_inventory[current_weapon_index];
			_old_weapon.Leaving_the_inventory();
			weapons_guarded--; 
			array_delete(weapon_inventory, current_weapon_index, 1);
		
			//Adicionando o objeto
			array_push(weapon_inventory, _closest_weapon);
			_closest_weapon.follow_player = id;
			_closest_weapon.weapon_in_inventory = true;
			weapon_equipped = _closest_weapon;
			weapons_guarded++;
		}
	}
	
	//Atirando
	if (keyboard_check_pressed(ord("F"))) {
		if (instance_exists(weapon_equipped)) {
			weapon_equipped.Shoot();
		}
	}
}