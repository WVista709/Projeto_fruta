if (weapon_in_inventory && instance_exists(follow_player)) {
    // Seguir a posição do jogador com um deslocamento
    x = follow_player.x + 8; // Ajuste esse valor conforme necessário
    y = follow_player.y;
}

if (speed > 0) speed -= .2;