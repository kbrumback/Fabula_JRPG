// Constants for debounce
if (!variable_global_exists("input_timer")) global.input_timer = 0;
if (global.input_timer > 0) {
    global.input_timer -= 1;
}

// Check for UP
if ((keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0, gp_padu)) && global.input_timer <= 0) {
    selected_class = (selected_class - 1 + array_length(global.class_options)) mod array_length(global.class_options);
    global.input_timer = 10;
}

// Check for DOWN
if ((keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(0, gp_padd)) && global.input_timer <= 0) {
    selected_class = (selected_class + 1) mod array_length(global.class_options);
    global.input_timer = 10;
}

// Check for SELECT (Enter or A button)
if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1)) {
    global.player_class = global.class_options[selected_class].name;
    room_goto(rm_character_creation); // Replace with your next room
}
