//Colidindo com o player
if (other.weapon_present != noone){
	instance_destroy(other.weapon_present)
}

other.weapon_equip = instance_create_layer(0, 0, layer, weapon_bullet);
instance_destroy();