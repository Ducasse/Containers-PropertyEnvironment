tests-iteration
testValuesDoWhenNoParent

	| sum |
	sum := 0. 
	self potentialParentEnvironment valuesDo: [ :e | sum := e + sum ].
	self assert: sum equals: 74.
	sum := 0. 
	self childEnvironment valuesDo: [ :e | sum := e + sum ].
	self assert: sum equals: 25.