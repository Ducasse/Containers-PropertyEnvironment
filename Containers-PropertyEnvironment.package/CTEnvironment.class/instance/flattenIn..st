conversion
flattenIn: aDictionable
	"Answer a new aDictionable of the receiver and its parents."

	self hasParent
		ifTrue: [ self parent flattenIn: aDictionable ].
	aDictionable addAll: self properties.
	^ aDictionable