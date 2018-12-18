Class {
	#name : #CTEnvironmentTest,
	#superclass : #TestCase,
	#instVars : [
		'potentialParentEnvironment',
		'childEnvironment'
	],
	#category : 'Containers-PropertyEnvironment'
}

{ #category : #accessing }
CTEnvironmentTest >> childEnvironment [
	^ childEnvironment
]

{ #category : #accessing }
CTEnvironmentTest >> childEnvironment: anObject [
	childEnvironment := anObject
]

{ #category : #helpers }
CTEnvironmentTest >> connectChildParent [
	self childEnvironment parent: self potentialParentEnvironment
]

{ #category : #resources }
CTEnvironmentTest >> environmentClass [
	^ CTEnvironment
]

{ #category : #accessing }
CTEnvironmentTest >> potentialParentEnvironment [
	^ potentialParentEnvironment
]

{ #category : #accessing }
CTEnvironmentTest >> potentialParentEnvironment: anObject [
	potentialParentEnvironment := anObject
]

{ #category : #resources }
CTEnvironmentTest >> setUp [
	self childEnvironment: self environmentClass new.
	self childEnvironment propertyAt: #P1inChildren put: 12.
	self childEnvironment propertyAt: #P2inChildren put: 13.
	self potentialParentEnvironment: self environmentClass new.
	self potentialParentEnvironment propertyAt: #P1inChildren put: 24.
	self potentialParentEnvironment propertyAt: #P0inParent put: 50
]

{ #category : #'tests-properties' }
CTEnvironmentTest >> testAllPropertiesInPresenceOfParent [
	| allP |
	self connectChildParent.
	allP := self childEnvironment allProperties keys.
	allP
		do: [ :each | 
			self
				assert:
					(#(#P0inParent #P1inChildren #P2inChildren #configurations)
						includes: each) ].
	allP := self potentialParentEnvironment allProperties keys.
	allP
		do: [ :each | 
			self assert: (#(#P0inParent #P1inChildren #configurations) includes: each) ]
]

{ #category : #'tests-properties' }
CTEnvironmentTest >> testAllPropertiesWithoutInheritance [

	| allP |
	allP := self childEnvironment allProperties keys.
	allP do: [ :each | self assert: (#(#P2inChildren #P1inChildren #configurations) includes: each) ].
	allP := self potentialParentEnvironment allProperties keys.
	allP do: [ :each | self assert: (#(#P0inParent #P1inChildren #configurations) includes: each) ]
]

{ #category : #'tests-lookup-dictionary' }
CTEnvironmentTest >> testAt [

	self childEnvironment at: #foo put: 'bar'.
	self assert: (self childEnvironment at: #foo) equals: 'bar'.
	self childEnvironment at: #foo put: 'baz'.
	self assert: (self childEnvironment at: #foo) equals: 'baz'.
	

]

{ #category : #'tests-lookup-dictionary' }
CTEnvironmentTest >> testAtAlsoLooksUpInParent [
	self connectChildParent.
	self
		assert: (self childEnvironment at: #P0inParent)
		equals: 50
]

{ #category : #'tests-lookup-dictionary' }
CTEnvironmentTest >> testAtIfAbsent [

	self assert: (self childEnvironment at: #foo put: 'bar') equals: 'bar'.
	self assert: (self childEnvironment at: #foo ifAbsent: [ 'baz' ]) equals: 'bar'.
	self assert: (self childEnvironment at: #bar ifAbsent: [ 'baz' ]) equals: 'baz'
]

{ #category : #'tests-lookup-dictionary' }
CTEnvironmentTest >> testAtIfAbsentDoesNotUseIfAbsentWhenPropertyIsDefinedInParent [
	self connectChildParent.
	"since the property P0inParent is defined in parent do not execute the ifAbsent: clause."
	self
		assert: (self childEnvironment at: #P0inParent ifAbsent: [ false ])
		equals: 50.
	self assert: (self childEnvironment at: #Zork ifAbsent: [ true ])
]

{ #category : #'tests-lookup-dictionary' }
CTEnvironmentTest >> testAtIfAbsentPut [
	
	self assert: (self childEnvironment at: #foo put: 'bar') equals: 'bar'.
	self assert: (self childEnvironment at: #foo) equals: 'bar'.
	
	self assert: (self childEnvironment at: #foo ifAbsentPut: [ 'baz' ]) equals: 'bar'.

	"ifAbsentPut: set the property with the put value"
	self assert: (self childEnvironment at: #bar ifAbsentPut: [ 'baz' ]) equals: 'baz'.
	self assert: (self childEnvironment at: #bar) equals: 'baz'
]

{ #category : #'tests-lookup-dictionary' }
CTEnvironmentTest >> testAtIfAbsentPutDoesNotUsePutWhenPropertyIsDefinedInParent [
	self connectChildParent.
	self
		assert: (self childEnvironment at: #P0inParent ifAbsentPut: [ false ])
		equals: 50.
	self
		assert: (self childEnvironment at: #Zork ifAbsentPut: [ true ]).
	self assert: (self childEnvironment at: #Zork) equals: true.
	self assert: (self childEnvironment includesLocalKey: #Zork).
	self deny: (self potentialParentEnvironment includesLocalKey: #Zork)
]

{ #category : #'tests-lookup-dictionary' }
CTEnvironmentTest >> testAtIfPresentIfAbsent [

	self assert: (self childEnvironment at: #foo put: 'bar') equals: 'bar'.
	self
		assert:
			(self childEnvironment
				at: #foo
				ifPresent: [ :smth | true ]
				ifAbsent: [ false ]).
	self
		deny:
			(self childEnvironment
				at: #foo2
				ifPresent: [ :smth | true ]
				ifAbsent: [ false ])
]

{ #category : #'tests-lookup-dictionary' }
CTEnvironmentTest >> testAtIfPresentIfAbsentInParent [
	self connectChildParent.
	self deny: (self childEnvironment includesLocalKey: #P0inParent).
	self assert: (self childEnvironment parent includesLocalKey: #P0inParent).
	self
		assert:
			(self childEnvironment
				at: #P0inParent
				ifPresent: [ :smth | true ]
				ifAbsent: [ false ])
]

{ #category : #'tests-lookup-dictionary' }
CTEnvironmentTest >> testAtPutDoesNotCannonizeKeyToBeASymbol [

	self childEnvironment at: #foo put: 'bar'.
	self assert: (self childEnvironment at: #foo) equals: 'bar'.
	self childEnvironment at: #foo put: 'baz'.
	self assert: (self childEnvironment at: #foo) equals: 'baz'.
	
	self childEnvironment at: 'foo2String' put: 'bar'.
	self assert: (self childEnvironment at: 'foo2String') equals: 'bar'.
	
	self childEnvironment at: 'foo3String' put: 'bar'.
	self assert: (self childEnvironment at: #'foo3String') equals: 'bar'.
]

{ #category : #'tests-lookup-dictionary' }
CTEnvironmentTest >> testChildrenAtOverridesParent [
	self connectChildParent.
	self
		assert: (self childEnvironment at: #P0inParent)
		equals: 50.
	self
		assert: (self childEnvironment at: #P1inChildren)
		equals: 12.
	self
		assert: (self childEnvironment parent at: #P1inChildren)
		equals: 24
]

{ #category : #'tests-lookup-properties' }
CTEnvironmentTest >> testChildrenPropertyAtOverridesParent [
	self connectChildParent.
	self
		assert: (self childEnvironment propertyAt: #P0inParent)
		equals: 50.
	self
		assert: (self childEnvironment propertyAt: #P1inChildren)
		equals: 12.
	self
		assert: (self childEnvironment parent propertyAt: #P1inChildren)
		equals: 24
]

{ #category : #'tests-lookup-properties' }
CTEnvironmentTest >> testChildrenPropertyOverridesParent [
	self connectChildParent.
	self
		assert: (self childEnvironment propertyAt: #P0inParent)
		equals: 50.
	self
		assert: (self childEnvironment propertyAt: #P1inChildren)
		equals: 12.
	self
		assert: (self childEnvironment parent propertyAt: #P1inChildren)
		equals: 24
]

{ #category : #'tests-copy' }
CTEnvironmentTest >> testCopyProperties [
	"I'm here to test if postCopy is right."

	| config |
	config := self environmentClass new.
	self deny: config properties == config copy properties
]

{ #category : #'tests-iteration' }
CTEnvironmentTest >> testDoWhenNoParent [

	| sum |
	sum := 0. 
	self potentialParentEnvironment do: [ :e | sum := e + sum ].
	self assert: sum equals: 74.
	sum := 0. 
	self childEnvironment do: [ :e | sum := e + sum ].
	self assert: sum equals: 25.
]

{ #category : #'tests-iteration' }
CTEnvironmentTest >> testDoWhenParent [
	
	| sum |
	self connectChildParent.
	sum := 0. 
	self potentialParentEnvironment do: [ :e | sum := e + sum ].
	self assert: sum equals: 74.
	sum := 0. 
	self childEnvironment do: [ :e | sum := e + sum ].
	self assert: sum equals: 25 + 74
]

{ #category : #'tests-properties' }
CTEnvironmentTest >> testFromDictionary [

	| dict env |
	dict := Dictionary new 
		at: #first put: 1;
		at: #second put: 2;
		yourself.
	
	env := CTEnvironment fromDictionary: dict. 
	
	self assert: (env at: #first) equals: 1.
	self assert: (env at: #second) equals: 2.
	self deny: env hasParent.
]

{ #category : #'tests-testing' }
CTEnvironmentTest >> testHasLocalProperty [

	self deny: (self childEnvironment hasLocalProperty: #foo).
	self childEnvironment propertyAt: #foo put: 'bar'.
	self assert: (self childEnvironment hasLocalProperty: #foo).
	self deny: (self childEnvironment hasLocalProperty: #bar).
	self deny: (self childEnvironment hasLocalProperty: #P0inParent).
	self assert: (self potentialParentEnvironment hasLocalProperty: #P0inParent).
]

{ #category : #'tests-testing' }
CTEnvironmentTest >> testHasParent [
	self connectChildParent.
	self deny: self potentialParentEnvironment hasParent.
	self assert: self childEnvironment hasParent
]

{ #category : #'tests-testing' }
CTEnvironmentTest >> testHasProperty [
	self connectChildParent.
	self assert: (self childEnvironment hasProperty: #P0inParent).
	self assert: (self childEnvironment hasProperty: #P1inChildren)
]

{ #category : #'tests-lookup-properties' }
CTEnvironmentTest >> testHasPropertyOnlyTestLocalProperties [

	self deny: (self childEnvironment hasLocalProperty: #foo).
	self childEnvironment propertyAt: #foo put: 'bar'.
	self assert: (self childEnvironment hasLocalProperty: #foo).
	self deny: (self childEnvironment hasLocalProperty: #bar).
	self deny: (self childEnvironment hasLocalProperty: #P0inParent).
	self assert: (self potentialParentEnvironment hasLocalProperty: #P0inParent).
]

{ #category : #'tests-lookup-dictionary' }
CTEnvironmentTest >> testIncludeKeyOnlyTestLocalProperties [

	self deny: (self childEnvironment includesLocalKey: #foo).
	self childEnvironment at: #foo put: 'bar'.
	self assert: (self childEnvironment includesLocalKey: #foo).
	self deny: (self childEnvironment includesLocalKey: #bar).
	self deny: (self childEnvironment includesLocalKey: #P0inParent).
	self assert: (self potentialParentEnvironment includesLocalKey: #P0inParent).
]

{ #category : #'tests-testing-dictionary' }
CTEnvironmentTest >> testIncludesKey [

	self connectChildParent.
	self assert: (self childEnvironment includesKey: #P0inParent).
	self assert: (self childEnvironment includesKey: #P1inChildren)
]

{ #category : #'tests-testing-dictionary' }
CTEnvironmentTest >> testIncludesLocalKey [

	self deny: (self childEnvironment includesLocalKey: #foo).
	self childEnvironment propertyAt: #foo put: 'bar'.
	self assert: (self childEnvironment includesLocalKey: #foo).
	self deny: (self childEnvironment includesLocalKey: #bar).
	self deny: (self childEnvironment includesLocalKey: #P0inParent).
	self assert: (self potentialParentEnvironment includesLocalKey: #P0inParent).
]

{ #category : #'tests-iteration' }
CTEnvironmentTest >> testKeysAndValuesDoWhenNoParent [
	
	| sum keys |
	sum := 0. 
	keys := Set new.
	self potentialParentEnvironment keysAndValuesDo: [ :k :v | sum := v + sum. keys add: k ].
	self assert: sum equals: 74.
	self assert: keys size equals: 2.
	self assert: (keys includes: #P0inParent).
	self assert: (keys includes: #P1inChildren).
	sum := 0. 
	keys := Set new.
	self childEnvironment keysAndValuesDo: [ :k :v | sum := v + sum. keys add: k ].
	self assert: sum equals: 25.
	self assert: keys size equals: 2.
	self assert: (keys includes: #P2inChildren).
	self assert: (keys includes: #P1inChildren).
]

{ #category : #'tests-iteration' }
CTEnvironmentTest >> testKeysAndValuesDoWhenParent [
	
	| sum keys |
	self connectChildParent.
	sum := 0. 
	keys := Set new.
	self potentialParentEnvironment keysAndValuesDo: [ :k :v | sum := v + sum. keys add: k ].
	self assert: sum equals: 74.
	self assert: keys size equals: 2.
	self assert: (keys includes: #P0inParent).
	self assert: (keys includes: #P1inChildren).
	sum := 0. 
	keys := Set new.
	self childEnvironment keysAndValuesDo: [ :k :v | sum := v + sum. keys add: k ].
	self assert: sum equals: 25 + 74.
	self assert: keys size equals: 3.
	self assert: (keys includes: #P2inChildren).
	self assert: (keys includes: #P1inChildren).
	self assert: (keys includes: #P0inParent).
]

{ #category : #'tests-iteration' }
CTEnvironmentTest >> testKeysWhenNoParent [

	self assert: (self childEnvironment keys includes: #P1inChildren).
	self assert: (self childEnvironment keys includes: #P2inChildren).
	self assert: self childEnvironment keys size equals: 2
]

{ #category : #'tests-iteration' }
CTEnvironmentTest >> testKeysWhenParent [
	"Keys of the parent should be returned too but without duplicates."
	self connectChildParent.
	self assert: (self childEnvironment keys includes: #P1inChildren).
	self assert: (self childEnvironment keys includes: #P2inChildren).
	self assert: (self childEnvironment keys includes: #P0inParent).
	self assert: self childEnvironment keys size equals: 3
]

{ #category : #'tests-properties' }
CTEnvironmentTest >> testPropertiesIsNotNil [
	self assert: self childEnvironment  properties notNil

]

{ #category : #'tests-lookup-properties' }
CTEnvironmentTest >> testPropertyAt [

	self childEnvironment  propertyAt: #foo put: 'bar'.
	self assert: (self childEnvironment propertyAt: #foo) equals: 'bar'.
	self childEnvironment propertyAt: #foo put: 'baz'.
	self assert: (self childEnvironment propertyAt: #foo) equals: 'baz'.
	

]

{ #category : #'tests-lookup-properties' }
CTEnvironmentTest >> testPropertyAtAlsoLooksUpInParent [
	self connectChildParent.
	self
		assert: (self childEnvironment propertyAt: #P0inParent)
		equals: 50
]

{ #category : #'tests-lookup-properties' }
CTEnvironmentTest >> testPropertyAtIfAbsent [

	self assert: (self childEnvironment propertyAt: #foo put: 'bar') equals: 'bar'.
	self assert: (self childEnvironment propertyAt: #foo ifAbsent: [ 'baz' ]) equals: 'bar'.
	self assert: (self childEnvironment propertyAt: #bar ifAbsent: [ 'baz' ]) equals: 'baz'
]

{ #category : #'tests-lookup-properties' }
CTEnvironmentTest >> testPropertyAtIfAbsentDoesNotUseIfAbsentWhenPropertyIsDefinedInParent [
	self connectChildParent.
	"since the property P0inParent is defined in parent do not execute the ifAbsent: clause."
	self
		assert: (self childEnvironment propertyAt: #P0inParent ifAbsent: [ false ])
		equals: 50.
	self assert: (self childEnvironment propertyAt: #Zork ifAbsent: [ true ])
]

{ #category : #'tests-lookup-properties' }
CTEnvironmentTest >> testPropertyAtIfAbsentPut [
	
	self assert: (self childEnvironment propertyAt: #foo put: 'bar') equals: 'bar'.
	self assert: (self childEnvironment propertyAt: #foo) equals: 'bar'.
	
	self assert: (self childEnvironment propertyAt: #foo ifAbsentPut: [ 'baz' ]) equals: 'bar'.

	"ifAbsentPut: set the property with the put value"
	self assert: (self childEnvironment propertyAt: #bar ifAbsentPut: [ 'baz' ]) = 'baz'.
	self assert: (self childEnvironment propertyAt: #bar) = 'baz'
]

{ #category : #'tests-lookup-properties' }
CTEnvironmentTest >> testPropertyAtIfAbsentPutDoesNotUsePutWhenPropertyIsDefinedInParent [
	self connectChildParent.
	self
		assert: (self childEnvironment propertyAt: #P0inParent ifAbsentPut: [ false ])
		equals: 50.
	self
		assert: (self childEnvironment propertyAt: #Zork ifAbsentPut: [ true ]).
	self assert: (self childEnvironment propertyAt: #Zork) equals: true.
	self assert: (self childEnvironment hasLocalProperty: #Zork).
	self deny: (self potentialParentEnvironment hasLocalProperty: #Zork)
]

{ #category : #'tests-lookup-properties' }
CTEnvironmentTest >> testPropertyAtIfPresentIfAbsent [

	self assert: (self childEnvironment propertyAt: #foo put: 'bar') equals: 'bar'.
	self
		assert:
			(self childEnvironment
				propertyAt: #foo
				ifPresent: [ :smth | true ]
				ifAbsent: [ false ]).
	self
		deny:
			(self childEnvironment
				propertyAt: #foo2
				ifPresent: [ :smth | true ]
				ifAbsent: [ false ])
]

{ #category : #'tests-lookup-properties' }
CTEnvironmentTest >> testPropertyAtIfPresentIfAbsentInParent [
	self connectChildParent.
	self deny: (self childEnvironment hasLocalProperty: #P0inParent).
	self assert: (self childEnvironment parent hasLocalProperty: #P0inParent).
	self
		assert:
			(self childEnvironment
				propertyAt: #P0inParent
				ifPresent: [ :smth | true ]
				ifAbsent: [ false ])
]

{ #category : #'tests-lookup-properties' }
CTEnvironmentTest >> testPropertyAtPutDoesNotCannonizeKeyToBeASymbol [

	self childEnvironment propertyAt: #foo put: 'bar'.
	self assert: (self childEnvironment propertyAt: #foo) equals: 'bar'.
	self childEnvironment propertyAt: #foo put: 'baz'.
	self assert: (self childEnvironment propertyAt: #foo) equals: 'baz'.
	
	self childEnvironment propertyAt: 'foo2String' put: 'bar'.
	self assert: (self childEnvironment propertyAt: 'foo2String') equals: 'bar'.
	
	self childEnvironment propertyAt: 'foo3String' put: 'bar'.
	self assert: (self childEnvironment propertyAt: #'foo3String') equals: 'bar'.
]

{ #category : #'tests-iteration' }
CTEnvironmentTest >> testValuesDoWhenNoParent [

	| sum |
	sum := 0. 
	self potentialParentEnvironment valuesDo: [ :e | sum := e + sum ].
	self assert: sum equals: 74.
	sum := 0. 
	self childEnvironment valuesDo: [ :e | sum := e + sum ].
	self assert: sum equals: 25.
]

{ #category : #'tests-iteration' }
CTEnvironmentTest >> testValuesDoWhenParent [
	
	| sum |
	self connectChildParent.
	sum := 0. 
	self potentialParentEnvironment valuesDo: [ :e | sum := e + sum ].
	self assert: sum equals: 74.
	sum := 0. 
	self childEnvironment valuesDo: [ :e | sum := e + sum ].
	self assert: sum equals: 25 + 74
]
