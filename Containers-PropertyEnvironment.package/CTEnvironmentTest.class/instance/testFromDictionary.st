tests-properties
testFromDictionary

	| dict env |
	dict := Dictionary new 
		at: #first put: 1;
		at: #second put: 2;
		yourself.
	
	env := CTEnvironment fromDictionary: dict. 
	
	self assert: (env propertyAt: #first) equals: 1.
	self assert: (env propertyAt: #second) equals: 2.
	self deny: env hasParent.