one sig List {	// one limit the amount of lists to 1 
  header: lone Node    // header: List x Node is a partial function
}

sig Node {
  link: lone Node   // link: Node x Node   
	// next is a preserved word in alloy so we use link here
}

pred Acyclic(l: List) {   // parameterized formula and l has no cycle
  all n: l.header.*link | n !in n.^link		// .*link starting at l.header, make more than zero traversal 
								// that node should not be in the n.^link goes all the way to the end
								// header -> n1 -> n2 -> n3
								// l.header = {n1}
								// l.header.next = {n2}
								// l.header.^next = {n2, n3}
								// l.header.*next = {n1, n2, n3}
}

pred Acyclic2(l: List) {	// there exist a node that has no next node e.g. the list should come to an end
	no l.header or some n: l.header.*link | no n.link
}

check {		// they are equivalent
	all l: List | Acyclic[l] <=> Acyclic2[l]
} for 6
run {}
/*

//fact { all n: Node | some l: List | n in l.header.*link }
fact { Node = List.header.*link } // get all the nodes in all the lists
//fact { all l: List | Acyclic[l] }
fact NoSharingOfNodes {
	all l1, l2: List | l1 = l2 or no l1.header.*link & l2.header.*link
}

run Acyclic

*/
