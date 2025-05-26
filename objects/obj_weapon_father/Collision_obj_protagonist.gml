if (!weapon_in_inventory && other.weapons_guarded < other.max_weapons) {
	weapon_in_inventory = true;
	other.weapons_guarded++;
    array_push(other.weapon_inventory, id);
	visible = false;
	follow_player = other.id;
}
