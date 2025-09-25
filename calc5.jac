"""Simple Calculator (Step 5)"""

walker Calculator {
    has a: float;
    has b: float;
    has operation: str;

    can start with `root entry;
    can calculate with calc_node entry;
}

node calc_node {
    has result: float = 0.0;
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
        print("Result:", result);
    }
}

with entry:__main__ {
    root spawn Calculator(5, 2, "add");
    root spawn Calculator(10, 3, "div");
}
