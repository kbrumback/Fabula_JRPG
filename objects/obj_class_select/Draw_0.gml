draw_set_font(fnt_playfair); // Use your custom font
draw_set_halign(fa_left);

for (var i = 0; i < array_length(global.class_options); i++) {
    var class_data = global.class_options[i]; // ✅ FIXED NAME
		y = 100 + i * 80;

    if (i == selected_class) {
        draw_set_color(c_yellow);
        draw_text(80, y - 20, ">"); // marker arrow
    } else {
        draw_set_color(c_white);
    }

    draw_text(100, y, class_data.name);
    draw_text(120, y + 20, class_data.description);
}
