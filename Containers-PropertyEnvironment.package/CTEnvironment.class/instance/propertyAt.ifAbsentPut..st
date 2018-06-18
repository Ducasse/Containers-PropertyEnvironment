accessing - properties
propertyAt: aKey ifAbsentPut: aBlock
	"Answer the value of the property ==aKey==, potentially defined in parents, or if the property doesn't exist adds and answers the result of evaluating ==aBlock==."

	"We look up first to know and once we know if the property is not defined somewhere, then we set it. We do it like that to avoid to execute the put block on the parent because the put should be executed on the child."
	^ self at: aKey ifAbsentPut: aBlock