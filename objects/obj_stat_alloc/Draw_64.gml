draw_set_font(fnt_playfair);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// GUI setup
var screen_w = display_get_gui_width();
var screen_h = display_get_gui_height();

// === Portrait ===
var portrait_w = 300;
var portrait_h = 300;
var portrait_x = (screen_w - portrait_w) div 2;
var portrait_y = 40;

draw_sprite_ext(sprite_goddess_portrait, 0, portrait_x, portrait_y, 1, 1, 0, c_white, 1);

// === Dialogue box ===
var box_w = screen_w - 100;
var box_h = 260;
var box_x = 50;
var box_y = portrait_y + portrait_h + 20;

// Background
draw_set_color(make_color_rgb(20, 20, 30));
draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, false);
draw_set_color(c_white);

// === Dialogue ===
if (state == "question") {
    var q = global.stat_questions[current_question];
    draw_text(box_x + 24, box_y + 20, "[Goddess] " + q.question);

    for (var i = 0; i < array_length(q.choices); i++) {
        y = box_y + 60 + i * 30;
        var prefix = (i == selected_index) ? ">> " : "   ";
        draw_text(box_x + 40, y, prefix + q.choices[i].text);
    }

} else if (state == "allocate") {
    draw_text(box_x + 24, box_y + 20, "[Goddess] You have " + string(free_points) + " points left to shape your soul...");

    var labels = ["STR", "DEX", "INT", "WIS", "CHA"];
    var keys   = ["str", "dex", "intellect", "wis", "charisma"];

    for (var i = 0; i < array_length(labels); i++) {
		y = box_y + 60 + i * 30;
        var prefix = (i == selected_stat) ? ">> " : "   ";

        var stat_value = 0;
        var current_key = keys[i];

        switch (current_key) {
            case "str":       stat_value = global.player_stats.str; break;
            case "dex":       stat_value = global.player_stats.dex; break;
            case "intellect": stat_value = global.player_stats.intellect; break;
            case "wis":       stat_value = global.player_stats.wis; break;
            case "charisma":  stat_value = global.player_stats.charisma; break;
        }

        draw_text(box_x + 40, y, prefix + labels[i] + ": " + string(stat_value));
    }

    if (free_points == 0) {
        draw_text(box_x + 24, box_y + box_h - 40, "Press ENTER to confirm.");
    }

} else if (state == "done") {
    draw_text(box_x + 24, box_y + 60, "[Goddess] Your essence is forged. Your journey begins now...");
    draw_text(box_x + 24, box_y + 100, "Press ENTER to continue.");
}
