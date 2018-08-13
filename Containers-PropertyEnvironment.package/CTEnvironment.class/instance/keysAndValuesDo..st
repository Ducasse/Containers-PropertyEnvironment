iteration
keysAndValuesDo: aBlock 
	"Evaluate aBlock for each of the receiver's keys and values, starting from the receiver and going up in its parent chain if any."

	properties keysAndValuesDo: aBlock.
	self hasParent ifTrue: [ parent keysAndValuesDo: aBlock ]
	