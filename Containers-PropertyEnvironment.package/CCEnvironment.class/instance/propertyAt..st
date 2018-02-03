accessing - properties
propertyAt: aKey
	"Answer the value of the property ==aKey==, potentially looking in the parent, raises an error if the property doesn't exist."


	^ properties
		at: aKey asSymbol
		ifAbsent: [ self hasParent
				ifTrue: [ self parent propertyAt: aKey ]
				ifFalse: [ self errorPropertyNotFound: aKey ] ]