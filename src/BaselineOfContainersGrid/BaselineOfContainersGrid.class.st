Class {
	#name : #BaselineOfContainersGrid,
	#superclass : #BaselineOf,
	#category : 'BaselineOfContainersGrid'
}

{ #category : #baselines }
BaselineOfContainersGrid >> baseline: spec [
	<baseline>

	spec for: #pharo do: [		
		spec package: 'Containers-Grid'.
		spec package: 'Containers-Grid-Tests' with: [ spec requires: #('Containers-Grid') ]
	]
]
