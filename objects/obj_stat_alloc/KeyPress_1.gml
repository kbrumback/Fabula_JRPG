if (state == "question") {
    for (var i = 0; i < 5; i++) {
        if (keyboard_check_pressed(ord(string(i + 49)))) { // 49 = '1' key
            var question = global.stat_questions[ current_question ];
            var choice = question.choices[ i ];
            var effects = choice.effects;

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
