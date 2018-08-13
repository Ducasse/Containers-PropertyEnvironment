tests-iteration
testDoWhenParent
	
	| sum |
	self connectChildParent.
	sum := 0. 
	self potentialParentEnvironment do: [ :e | sum := e + sum ].
	self assert: sum equals: 74.
	sum := 0. 
	self childEnvironment do: [ :e | sum := e + sum ].
	self assert: sum equals: 25 + 74