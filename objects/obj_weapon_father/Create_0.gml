enum GUNS{
	EMPTY, PISTOL, KNIFE
}

enum TYPE {
	RANGED, MELEE	
}

weapon_name = GUNS.EMPTY;
weapon_damage = 0;
weapon_fire_rate = 1;
weapon_ammo = -1;
weapon_type = TYPE.RANGED //ranged ou melee
weapon_projectile_speed = 0;
weapon_reload_time = -1;
weapon_accuracy = 1;
weapon_in_inventory = false;
projectile_default = obj_bullet_teste;
follow_player = noone;

function Shoot(){
	if (weapon_type == TYPE.RANGED && weapon_ammo != 0){
		//Disparar a arma
		show_debug_message("ATIRANDO");
		
		var _projectile = instance_create_layer(x, y, layer, projectile_default);
		_projectile.speed = 10;
		_projectile.x = mouse_x;
		_projectile.y = mouse_y;
		
	} else if (weapon_type == TYPE.MELEE){
		//Ataque de corpo a corpo	
		show_debug_message("Batendo");
	}
}

function Leaving_the_inventory(){
	var _throw_speed = 6;
	var _dir = image_angle;
	x = x + lengthdir_x(8, _dir);
	y = y + lengthdir_y(8, _dir);
	speed = _throw_speed;
	direction = _dir;
	follow_player = noone;
	weapon_in_inventory = false;
}
