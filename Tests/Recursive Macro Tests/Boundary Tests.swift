import Functor_Base_Macro
import Recursive_Macro
import Testing

@FunctorBase
@Recursive
private indirect enum Tree {
    case leaf(Int)
    case node(Tree, Tree)
}

@Suite
struct `Recursive boundaries` {
    @Test
    func `a leaf projects to its payload without recursion`() {
        guard case .leaf(7) = Tree.leaf(7).project() else {
            Issue.record("Expected the leaf payload")
            return
        }
    }

    @Test
    func `a node projects both children unchanged and in order`() {
        guard case .node(let left, let right) = Tree.node(.leaf(1), .node(.leaf(2), .leaf(3))).project(),
            case .leaf(1) = left,
            case .node(.leaf(2), .leaf(3)) = right
        else {
            Issue.record("Expected both original children")
            return
        }
    }
}
