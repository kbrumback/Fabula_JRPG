if (!variable_global_exists("player_stats") || !is_struct(global.player_stats)) {
    global.player_stats = {
        str: 10,
        dex: 10,
        intellect: 10,
        wis: 10,
        charisma: 10
    };
}
