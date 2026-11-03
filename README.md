# swift-recursive

Use this package when you need to take a value of a recursive enum apart one layer at a time through its base functor, so that folds such as catamorphisms can consume it. Start from the `@Recursive` macro: put it on the recursive enum next to `@FunctorBase`, and it adds a `project()` that turns `Self` into one `Base<Self>` layer. To build values from layers instead, use swift-corecursive; when an enum needs both directions, use swift-birecursive on its enclosing namespace; when several recursion schemes are wanted at once, use swift-recursion.

## Laws

- `project()` removes exactly one layer: each enum case maps to the base case of the same name, with the payloads passed through in order and their labels kept. Recursive children are returned unchanged, not projected further. Cases without payloads map to the matching base case without payloads.
- `@Recursive` does not create `Base<Self>`; the enum must also carry `@FunctorBase`.
- `project()` has the enum's access level when that level is `public` or `package`, and is internal otherwise.
- `@Recursive` on anything other than an enum is a compile error.
- The enum may only refer to itself directly, as a payload spelled `Self` or as its own name with its own type parameters unchanged. A payload such as an optional, array or tuple of `Self`, or the enum applied to other type arguments, is rejected with a compile error, and so are type parameters with constraints or a `where` clause. Such enums need a hand-written `project()`.
