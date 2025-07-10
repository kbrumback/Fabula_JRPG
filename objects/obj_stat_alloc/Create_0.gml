// === STAT START VALUES ===
global.player_stats = {
    str: 10,
    dex: 10,
    int: 10,
    wis: 10,
    cha: 10
};

// === QUESTIONS ===
global.stat_questions = [];

// Question 1
global.stat_questions[0] = {
    question: "How did you handle conflict in your old life?",
    choices: [
        { text: "Fought back",     effects: { str: 3, cha: -1 } },
        { text: "Tried to talk it out", effects: { cha: 3, str: -1 } },
        { text: "Avoided it",      effects: { dex: 2, wis: 1, str: -2 } },
        { text: "Analyzed first",  effects: { int: 2, wis: 1, dex: -1 } },
        { text: "Stood silently",  effects: { wis: 3, cha: -1 } }
    ]
};

// Question 2
global.stat_questions[1] = {
    question: "What role did you play in your community?",
    choices: [
        { text: "Protector", effects: { str: 2, wis: 1 } },
        { text: "Healer",    effects: { wis: 2, cha: 1 } },
        { text: "Scout",     effects: { dex: 2, int: 1 } },
        { text: "Scholar",   effects: { int: 2, cha: 1 } },
        { text: "Leader",    effects: { cha: 2, str: 1 } }
    ]
};

// Question 3
global.stat_questions[2] = {
    question: "What do you value most?",
    choices: [
        { text: "Power",     effects: { str: 2, int: -1 } },
        { text: "Freedom",   effects: { dex: 2, wis: -1 } },
        { text: "Knowledge", effects: { int: 2, cha: -1 } },
        { text: "Peace",     effects: { wis: 2, str: -1 } },
        { text: "Connection",effects: { cha: 2, dex: -1 } }
    ]
};

// Question 4
global.stat_questions[3] = {
    question: "What did you fear the most?",
    choices: [
        { text: "Weakness",    effects: { str: 2, wis: -1 } },
        { text: "Captivity",   effects: { dex: 2, cha: -1 } },
        { text: "Ignorance",   effects: { int: 2, str: -1 } },
        { text: "Isolation",   effects: { cha: 2, wis: -1 } },
        { text: "Chaos",       effects: { wis: 2, dex: -1 } }
    ]
};

// Question 5
global.stat_questions[4] = {
    question: "How were you seen by others?",
    choices: [
        { text: "A hero",      effects: { str: 1, cha: 2 } },
        { text: "A mystery",   effects: { int: 2, dex: 1 } },
        { text: "A healer",    effects: { wis: 2, cha: 1 } },
        { text: "A trickster", effects: { dex: 2, int: 1 } },
        { text: "A leader",    effects: { cha: 2, wis: 1 } }
    ]
};

// === STATE ===
current_question = 0;
selected_answers = [];
state = "question";

// === POINTS ===
free_points = 10;
