iteration
valuesDo: aBlock

	properties valuesDo: aBlock.
	self hasParent ifTrue: [ parent valuesDo: aBlock ]
	