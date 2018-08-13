conversion
allProperties
	"Answer all properties of the receiver and its parents."
	"This method should be removed.... or at least should return a CTEnvironment"
	| parentProperties |
	parentProperties := self hasParent
		ifTrue: [ parent allProperties ]
		ifFalse: [ Dictionary new ].
	parentProperties addAll: self properties.
	"addAll: is not in the current API of environment"
	^ parentProperties