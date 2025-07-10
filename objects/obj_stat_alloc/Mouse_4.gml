if (state == "question") {
    var mouse_y_pos = device_mouse_y(0);
    
    for (var i = 0; i < 5; i++) {
        var choice_y = 100 + i * 30;
        if (mouse_y_pos > choice_y - 10 && mouse_y_pos < choice_y + 10) {
            // Get the selected choice
            var question = global.stat_questions[ current_question ];
            var choice = question.choices[ i ];
            var effects = choice.effects;

            // Apply stat effects
            var keys = array_keys(effects);
            for (var j = 0; j < array_length(keys); j++) {
                var key = keys[j];
                global.player_stats[? key] += effects[? key];
            }

            array_push(selected_answers, i);
            current_question++;

            if (current_question >= array_length(global.stat_questions)) {
                state = "allocate";
            }
            break;
        }
    }
}
