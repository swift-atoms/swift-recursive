@attached(member, names: arbitrary)
public macro Recursive() = #externalMacro(
    module: "Recursive_Macro_Plugin",
    type: "Macro"
)
