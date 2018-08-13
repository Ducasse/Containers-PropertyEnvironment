iteration
keysDo: aBlock 
	"Evaluate aBlock for each of the receiver's keys, starting from the receiver and going up in its parent chain if any."

	properties keysDo: aBlock.
	self hasParent ifTrue: [ parent keysDo: aBlock ]
	