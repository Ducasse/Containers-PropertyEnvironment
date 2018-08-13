iteration
valuesDo: aBlock
	"Evaluate aBlock for each of the receiver's values, starting from the receiver and going up in its parent chain if any."
	
	properties valuesDo: aBlock.
	self hasParent ifTrue: [ parent valuesDo: aBlock ]
	