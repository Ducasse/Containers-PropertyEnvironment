tests-iteration
testKeysWhenParent
	"Keys of the parent should be returned too but without duplicates."
	self connectChildParent.
	self assert: (self childEnvironment keys includes: #P1inChildren).
	self assert: (self childEnvironment keys includes: #P2inChildren).
	self assert: (self childEnvironment keys includes: #P0inParent).
	self assert: self childEnvironment keys size equals: 3