instance creation
fromDictionary: aDictionary

	| inst |
	inst := self new. 
	aDictionary keysAndValuesDo: [ :k :v | inst at: k put: v ].
	^ inst
	