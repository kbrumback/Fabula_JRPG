// Movement speed
var move_speed = 2;

// Input (keyboard + gamepad)
var hinput = keyboard_check(vk_right) - keyboard_check(vk_left);
hinput += gamepad_axis_value(0, gp_axislh);

var vinput = keyboard_check(vk_down) - keyboard_check(vk_up);
vinput += gamepad_axis_value(0, gp_axislv);

// Normalize direction for consistent movement
var move_x = sign(hinput);
var move_y = sign(vinput);

// Normalize diagonal movement
var magnitude = poIntellect_distance(0, 0, move_x, move_y);
if (magnitude > 0) {
    x += (move_x / magnitude) * move_speed;
    y += (move_y / magnitude) * move_speed;
}

// Sprite switching
if (abs(move_x) > abs(move_y)) {
    if (move_x > 0) {
        sprite_index = sprite_right;
    } else if (move_x < 0) {
        sprite_index = sprite_left;
    }
} else if (move_y != 0) {
    if (move_y > 0) {
        sprite_index = sprite_down;
    } else {
        sprite_index = sprite_up;
    }
}

// Handle animation frame when idle
if (move_x == 0 && move_y == 0) {
    image_speed = 0; // Freeze animation
    image_index = 0; // Set to first frame (idle pose)
} else {
    image_speed = 1; // Adjust for walk speed
}
