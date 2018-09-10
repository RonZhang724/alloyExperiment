# alloyExperiment

```
sig S {} //set
run { some S } for 3 // command that indicates that S is not empty
                     // back end analyzer is goingenumerate all the sets 
                     // Three un-empty sets exists 
                     // {S1, S2, S3} there are 7 un-empty subsets however alloy will only generate 3 types of sets 
                     // because it take out isomorphic sets e.g. {S1} s= {S2}
```

```
class List{
  Node header;
  static class Node{
    Node next;
  }
}
```
## Discrete Math Concept
r: A x B
* A = {a1, a2}
* B = {b1, b2}

A relation r will map A to B
A total function map one thing to exactly one thing: a1 x b2 a2 x b2
A partial function: a1 x b2

```
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
	no l.header or some n: l.heaer.*link | no n.link
}

check {		// they are equivalent
	all l: List | Acyclic[l] <=> Acyclic2[l]
}

//fact { all n: Node | some l: List | n in l.header.*link }
fact { Node = List.header.*link } // get all the nodes in all the lists
//fact { all l: List | Acyclic[l] }
fact NoSharingOfNodes {
	all l1, l2: List | l1 = l2 or no l1.header.*link & l2.header.*link
}

run Acyclic
```

                     

