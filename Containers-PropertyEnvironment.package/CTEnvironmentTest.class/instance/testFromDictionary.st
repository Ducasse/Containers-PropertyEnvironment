tests-properties
testFromDictionary

	| dict env |
	dict := Dictionary new 
		at: #first put: 1;
		at: #second put: 2;
		yourself.
	
	env := CTEnvironment fromDictionary: dict. 
	
	self assert: (env at: #first) equals: 1.
	self assert: (env at: #second) equals: 2.
	self deny: env hasParent.