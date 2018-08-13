conversion
flattenIn: aDictionable
	"Answer a new aDictionable of the receiver and its parents."

	self hasParent
		ifTrue: [ parent flattenIn: aDictionable ].
	aDictionable addAll: properties.
	^ aDictionable