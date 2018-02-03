accessing - properties
allProperties
	"Answer all properties of the receiver and its parents."

	| parentProperties |
	parentProperties := self hasParent
		ifTrue: [ self parent allProperties ]
		ifFalse: [ Dictionary new ].
	parentProperties addAll: self properties.
	^ parentProperties