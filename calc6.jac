"""Simple Calculator with AI Explanation (Step 6)"""

import from byllm.llm { Model }

glob llm = Model(model_name="gemini/gemini-2.0-flash", verbose=False);

def explain(a: float, b: float, operation: str, result: float) -> str by llm();

walker Calculator {
    has a: float;
    has b: float;
    has operation: str;

    can start with `root entry;
    can calculate with calc_node entry;
}

node calc_node {
    has result: float = 0.0;
    has explanation: str = "";
}

impl calc_node {
    can calculate {
        if walker.operation == "add" {
            result = walker.a + walker.b;
        }
        elif walker.operation == "sub" {
            result = walker.a - walker.b;
        }
        elif walker.operation == "mul" {
            result = walker.a * walker.b;
        }
        elif walker.operation == "div" {
            if walker.b != 0 {
                result = walker.a / walker.b;
            }
            else {
                print("Error: divide by zero");
        }

        if result != 0.0 {
            explanation = explain(walker.a, walker.b, walker.operation, result);
            print("Result:", result);
            print("AI Explanation:", explanation);
    }
}

with entry:__main__ {
    root spawn Calculator(8, 2, "div");
    root spawn Calculator(4, 7, "mul");
}
