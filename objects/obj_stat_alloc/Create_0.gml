// Ensure stat struct is valid
if (!variable_global_exists("player_stats") || !is_struct(global.player_stats)) {
    global.player_stats = {
        str: 10,
        dex: 10,
        intellect: 10,
        wis: 10,
        charisma: 10
    };
}

// Question and allocation state
current_question = 0;
selected_index = 0;
selected_stat = 0;
selected_answers = [];
state = "question";
input_cooldown = 0;
free_points = 10;

// Define questions and effects
global.stat_questions = [];

global.stat_questions[0] = {
    question: "How did you handle conflict in your old life?",
    choices: [
        { text: "Fought back",     effects: { str: 3, charisma: -1 } },
        { text: "Tried to talk it out", effects: { charisma: 3, str: -1 } },
        { text: "Avoided it",      effects: { dex: 2, wis: 1, str: -2 } },
        { text: "Analyzed first",  effects: { intellect: 2, wis: 1, dex: -1 } },
        { text: "Stood silently",  effects: { wis: 3, charisma: -1 } }
    ]
};

global.stat_questions[1] = {
    question: "What role did you play in your community?",
    choices: [
        { text: "Protector", effects: { str: 2, wis: 1 } },
        { text: "Healer",    effects: { wis: 2, charisma: 1 } },
        { text: "Scout",     effects: { dex: 2, intellect: 1 } },
        { text: "Scholar",   effects: { intellect: 2, charisma: 1 } },
        { text: "Leader",    effects: { charisma: 2, str: 1 } }
    ]
};

global.stat_questions[2] = {
    question: "What do you value most?",
    choices: [
        { text: "Power",     effects: { str: 2, intellect: -1 } },
        { text: "Freedom",   effects: { dex: 2, wis: -1 } },
        { text: "Knowledge", effects: { intellect: 2, charisma: -1 } },
        { text: "Peace",     effects: { wis: 2, str: -1 } },
        { text: "Connection",effects: { charisma: 2, dex: -1 } }
    ]
};

global.stat_questions[3] = {
    question: "What did you fear the most?",
    choices: [
        { text: "Weakness",    effects: { str: 2, wis: -1 } },
        { text: "Captivity",   effects: { dex: 2, charisma: -1 } },
        { text: "Ignorance",   effects: { intellect: 2, str: -1 } },
        { text: "Isolation",   effects: { charisma: 2, wis: -1 } },
        { text: "Chaos",       effects: { wis: 2, dex: -1 } }
    ]
};

global.stat_questions[4] = {
    question: "How were you seen by others?",
    choices: [
        { text: "A hero",      effects: { str: 1, charisma: 2 } },
        { text: "A mystery",   effects: { intellect: 2, dex: 1 } },
        { text: "A healer",    effects: { wis: 2, charisma: 1 } },
        { text: "A trickster", effects: { dex: 2, intellect: 1 } },
        { text: "A leader",    effects: { charisma: 2, wis: 1 } }
    ]
};

// Store base stats after question phase completes
base_stats = {
    str: global.player_stats.str,
    dex: global.player_stats.dex,
    intellect: global.player_stats.intellect,
    wis: global.player_stats.wis,
    charisma: global.player_stats.charisma
};
