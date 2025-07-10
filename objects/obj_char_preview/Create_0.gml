char_index = 0; // Start with first sprite set (0–9)
update_sprite();

function update_sprite() {
    sprite_index = global.char_down[char_index]; // set to down-facing preview
}

