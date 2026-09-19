import Functor_Base_Macro
import Recursive_Macro
import Testing

@FunctorBase
@Recursive
private indirect enum Natural {
    case zero
    case successor(Natural)
}

@Test
func `recursive derivation projects one layer`() {
    let child = Natural.zero
    guard case let .successor(projected) = Natural.successor(child).project() else {
        Issue.record("Expected successor layer")
        return
    }
    guard case .zero = projected else {
        Issue.record("Expected original child")
        return
    }
}
