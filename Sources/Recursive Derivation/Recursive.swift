@attached(member, names: arbitrary)
public macro Recursive() = #externalMacro(
    module: "Recursive_Derivation_Macros",
    type: "Macro"
)
