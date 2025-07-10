/// === Input cooldown ===
if (input_cooldown > 0) {
    input_cooldown -= 1;
}

/// === Question Phase ===
if (state == "question") {
    var choices = global.stat_questions[current_question].choices;

    if (input_cooldown <= 0) {
        // Navigation
        if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || gamepad_button_check_pressed(0, gp_padd)) {
            selected_index = (selected_index + 1) mod array_length(choices);
            input_cooldown = 6;
        }

        if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(0, gp_padu)) {
            selected_index = (selected_index - 1 + array_length(choices)) mod array_length(choices);
            input_cooldown = 6;
        }

        // Selection
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(0, gp_face1)) {
            var choice = choices[selected_index];
            var e = choice.effects;

            // Apply stat effects safely
            if (variable_struct_exists(e, "str"))       global.player_stats.str       += e.str;
            if (variable_struct_exists(e, "dex"))       global.player_stats.dex       += e.dex;
            if (variable_struct_exists(e, "intellect")) global.player_stats.intellect += e.intellect;
            if (variable_struct_exists(e, "wis"))       global.player_stats.wis       += e.wis;
            if (variable_struct_exists(e, "charisma"))  global.player_stats.charisma  += e.charisma;

            array_push(selected_answers, selected_index);
            current_question++;
            selected_index = 0;

            if (current_question >= array_length(global.stat_questions)) {
                // Save base stat snapshot
			    base_stats = {
			        str: global.player_stats.str,
			        dex: global.player_stats.dex,
			        intellect: global.player_stats.intellect,
			        wis: global.player_stats.wis,
			        charisma: global.player_stats.charisma
			    };
			    state = "allocate";
}
				

            input_cooldown = 6;
        }
    }
}

/// === Stat Allocation Phase ===
if (state == "allocate") {
    var keys = ["str", "dex", "intellect", "wis", "charisma"];
    var stat_count = array_length(keys);
    var max_stat = 20;

    if (input_cooldown <= 0) {
        // Navigation
        if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || gamepad_button_check_pressed(0, gp_padd)) {
            selected_stat = (selected_stat + 1) mod stat_count;
            input_cooldown = 6;
        }

        if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(0, gp_padu)) {
            selected_stat = (selected_stat - 1 + stat_count) mod stat_count;
            input_cooldown = 6;
        }

        var current_key = keys[selected_stat];

        // === Increase stat
        if ((keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")) || gamepad_button_check_pressed(0, gp_padr)) && free_points > 0) {
            var stat_value = 0;
            switch (current_key) {
                case "str":       stat_value = global.player_stats.str; break;
                case "dex":       stat_value = global.player_stats.dex; break;
                case "intellect": stat_value = global.player_stats.intellect; break;
                case "wis":       stat_value = global.player_stats.wis; break;
                case "charisma":  stat_value = global.player_stats.charisma; break;
            }

            if (stat_value < max_stat) {
                switch (current_key) {
                    case "str":       global.player_stats.str       += 1; break;
                    case "dex":       global.player_stats.dex       += 1; break;
                    case "intellect": global.player_stats.intellect += 1; break;
                    case "wis":       global.player_stats.wis       += 1; break;
                    case "charisma":  global.player_stats.charisma  += 1; break;
                }
                free_points -= 1;
                input_cooldown = 6;
            }
        }

        // === Decrease stat
		if ((keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")) || gamepad_button_check_pressed(0, gp_padl))) {
		    var stat_value = 0;
		    var base_value = 0;

		    switch (current_key) {
		        case "str":       stat_value = global.player_stats.str;       base_value = base_stats.str; break;
		        case "dex":       stat_value = global.player_stats.dex;       base_value = base_stats.dex; break;
		        case "intellect": stat_value = global.player_stats.intellect; base_value = base_stats.intellect; break;
		        case "wis":       stat_value = global.player_stats.wis;       base_value = base_stats.wis; break;
		        case "charisma":  stat_value = global.player_stats.charisma;  base_value = base_stats.charisma; break;
		    }

		    if (stat_value > base_value) {
		        switch (current_key) {
		            case "str":       global.player_stats.str       -= 1; break;
		            case "dex":       global.player_stats.dex       -= 1; break;
		            case "intellect": global.player_stats.intellect -= 1; break;
		            case "wis":       global.player_stats.wis       -= 1; break;
		            case "charisma":  global.player_stats.charisma  -= 1; break;
		        }
		        free_points += 1;
		        input_cooldown = 6;
		    }
}


        // Confirm stat allocation
        if ((keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(0, gp_face1)) && free_points == 0) {
            state = "done";
        }
    }
}

/// === Done State ===
if (state == "done") {
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(0, gp_face1)) {
        room_goto(rm_class_select); // Replace with your next room
    }
}
