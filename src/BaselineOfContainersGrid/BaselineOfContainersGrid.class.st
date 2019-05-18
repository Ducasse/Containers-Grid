Class {
	#name : #BaselineOfContainersGrid,
	#superclass : #BaselineOf,
	#category : 'BaselineOfContainersGrid'
}

{ #category : #baselines }
BaselineOfContainersGrid >> baseline: spec [
	<baseline>

	spec for: #pharo do: [		
		spec package: 'Containers-Trie'.
		spec package: 'Containers-Trie-Tests' with: [ spec requires: #('Containers-Trie') ]
	]
]
