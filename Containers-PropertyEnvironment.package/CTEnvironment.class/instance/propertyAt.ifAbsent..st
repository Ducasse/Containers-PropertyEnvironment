accessing - properties
propertyAt: aKey ifAbsent: aBlock
	"Answer the value of the property ==aKey==, potentially looking in parents, or the result of ==aBlock== if the property doesn't exist."

	^ self at: aKey ifAbsent: aBlock