if (state == "question") {
    var q = global.stat_questions[current_question];
    draw_text(50, 50, "Q" + string(current_question + 1) + ": " + q.question);

    for (var i = 0; i < array_length(q.choices); i++) {
			y = 100 + i * 30;
        draw_text(70, y, string(i + 1) + ") " + q.choices[i].text);
    }

} else if (state == "allocate") {
    draw_text(50, 40, "Allocate your remaining stat points: " + string(free_points));
    var labels = ["STR", "DEX", "INT", "WIS", "CHA"];
    var keys   = ["str", "dex", "int", "wis", "cha"];

    for (var i = 0; i < array_length(labels); i++) {
			y = 80 + i * 30;
        draw_text(60, y, labels[i] + ": " + string(global.player_stats[? keys[i]]) + " [+/-]");
    }

    if (free_points == 0) {
        draw_text(60, 260, "Press ENTER to confirm stats.");
    }

} else if (state == "done") {
    draw_text(60, 100, "Stat Allocation Complete!");
    draw_text(60, 130, "Press ENTER to continue...");
}
