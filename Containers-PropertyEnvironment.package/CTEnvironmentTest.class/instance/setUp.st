resources
setUp
	self childEnvironment: self environmentClass new.
	self childEnvironment propertyAt: #P1inChildren put: 12.
	self childEnvironment propertyAt: #P2inChildren put: 13.
	self potentialParentEnvironment: self environmentClass new.
	self potentialParentEnvironment propertyAt: #P1inChildren put: 24.
	self potentialParentEnvironment propertyAt: #P0inParent put: 50