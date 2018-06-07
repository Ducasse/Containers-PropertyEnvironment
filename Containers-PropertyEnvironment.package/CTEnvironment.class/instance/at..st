accessing - dictionary
at: aKey
	"Answer the value of the property ==aKey==, potentially looking in the parent, raises an error if the property doesn't exist."


	^ properties
		at: aKey asSymbol
		ifAbsent: [ self hasParent
				ifTrue: [ self parent at: aKey ]
				ifFalse: [ self errorPropertyNotFound: aKey ] ]