// === Input Delay Handling ===
if (!variable_global_exists("input_timer")) input_timer = 0;
input_timer = max(0, input_timer - 1);

// === Left / Right Navigation ===
var move_input = 0;

// Keyboard support
if (keyboard_check_pressed(vk_right)) move_input = 1;
if (keyboard_check_pressed(vk_left)) move_input = -1;

// Gamepad support (D-Pad or Left Stick X-Axis)
if (gamepad_is_connected(0)) {
    if (gamepad_button_check_pressed(0, gp_padr)) move_input = 1;
    if (gamepad_button_check_pressed(0, gp_padl)) move_input = -1;

    var stick_x = gamepad_axis_value(0, gp_axislh); // left stick X-axis
    if (stick_x > 0.5 && input_timer <= 0) {
        move_input = 1;
        input_timer = 10;
    }
    if (stick_x < -0.5 && input_timer <= 0) {
        move_input = -1;
        input_timer = 10;
    }
}

if (move_input != 0) {
    char_index = (char_index + move_input + array_length(global.char_down)) mod array_length(global.char_down);
    update_sprite();
}

// === Confirm Selection (Enter or A) ===
if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1)) {
    global.player_up = global.char_up[char_index];
    global.player_down = global.char_down[char_index];
    global.player_left = global.char_left[char_index];
    global.player_right = global.char_right[char_index];

    room_goto(rm_game_start); // Your actual gameplay room
}
