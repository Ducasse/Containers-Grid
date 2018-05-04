baselines
baseline: spec
	<baseline>

	spec for: #pharo do: [		
		spec package: 'Containers-Grid'.
		spec package: 'Containers-Grid-Tests' with: [ spec requires: #('Containers-Grid') ]
	]