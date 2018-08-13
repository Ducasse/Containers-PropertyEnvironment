tests-iteration
testKeysAndValuesDoWhenNoParent
	
	| sum keys |
	sum := 0. 
	keys := Set new.
	self potentialParentEnvironment keysAndValuesDo: [ :k :v | sum := v + sum. keys add: k ].
	self assert: sum equals: 74.
	self assert: keys size equals: 2.
	self assert: (keys includes: #P0inParent).
	self assert: (keys includes: #P1inChildren).
	sum := 0. 
	keys := Set new.
	self childEnvironment keysAndValuesDo: [ :k :v | sum := v + sum. keys add: k ].
	self assert: sum equals: 25.
	self assert: keys size equals: 2.
	self assert: (keys includes: #P2inChildren).
	self assert: (keys includes: #P1inChildren).