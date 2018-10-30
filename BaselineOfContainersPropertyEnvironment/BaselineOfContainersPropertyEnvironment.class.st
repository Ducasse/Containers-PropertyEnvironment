Class {
	#name : #BaselineOfContainersPropertyEnvironment,
	#superclass : #BaselineOf,
	#category : 'BaselineOfContainersPropertyEnvironment'
}

{ #category : #baselines }
BaselineOfContainersPropertyEnvironment >> baseline: spec [
	<baseline>

	spec for: #pharo do: [		
		spec 
			package: 'Containers-PropertyEnvironment'.
		]
]
