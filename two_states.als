abstract sig State {}

one sig Pre, Post extends State {}

sig List {
	header: Node  -> State	// header: List x Node x State
}

sig Node {
	link: Node -> State
}

run {}

// remember to use the evaluate tool in the show to run commands like: link, List, some List...
