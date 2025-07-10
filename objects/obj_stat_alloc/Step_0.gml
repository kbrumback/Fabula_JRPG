if (state == "allocate") {
    var keys = ["str", "dex", "int", "wis", "cha"];

    // Use keyboard 1–5 to select stat, + to add, - to subtract
    for (var i = 0; i < array_length(keys); i++) {
        if (keyboard_check_pressed(ord(string(i + 49)))) { // 1 to 5
            selected_stat = keys[i];
        }
    }

    if (keyboard_check_pressed(vk_add) && free_points > 0) {
        global.player_stats[? selected_stat] += 1;
        free_points -= 1;
    }

    if (keyboard_check_pressed(vk_subtract) && global.player_stats[? selected_stat] > 1) {
        global.player_stats[? selected_stat] -= 1;
        free_points += 1;
    }

    if (keyboard_check_pressed(vk_enter) && free_points == 0) {
        state = "done";
    }
}
