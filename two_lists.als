sig List {
	header: lone Node,
	header': lone Node // older header and new header
}

sig Node {
	elem: Int, elem': Int, 
	link: lone Node, link': lone Node
}

pred Acyclic (l: List) {
	all n: l.header.*link | n !in n.^link
}

pred Acyclic' (l: List) {
	all n: l.header'.*link' | n !in n.^link'
}

pred RemoveFirst (l: List) {
	Acyclic[l]	// the list must be acyclic at the pre-state
	l.header.*link.elem - l.header.elem = l.header'.*link'.elem' // before - header elem = after
	Acyclic'[l]	// the list must be acyclic at the post-state
}

run RemoveFirst for 1 List, 3 Node, 2 int // add a boundary to the elem [-2, 2]
// change theme of elem in Show to combine elem with Node
