-- Insert credits into Codex
table.insert(CodexOrdering.Order, "hadesSett")
CodexOrdering.hadesSett = {
    Order = {
        "Credits",
    }
}

Codex.hadesSett = {
    UnlockType = CodexUnlockTypes.Mystery,
    TitleText = "Hades x Sett",

    Entries = {
        Credits = {
            Entries = {
                {
                    Text = "hadesSettCredits",
                }
            }
        }
    }
}