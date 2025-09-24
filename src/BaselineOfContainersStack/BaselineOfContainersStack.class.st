Class {
	#name : 'BaselineOfContainersStack',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfContainersStack',
	#package : 'BaselineOfContainersStack'
}

{ #category : 'baselines' }
BaselineOfContainersStack >> baseline: spec [ 
	<baseline>

	spec for: #pharo do: [		
		spec package: 'Containers-Stack'.
		spec package: 'Containers-Stack-Tests' with: [ spec requires: #('Containers-Stack') ]
	]
]
