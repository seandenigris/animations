*animations-core
transformedCanvasOn: aCanvas

	| transformedCanvas |
	transformedCanvas := self ignoresColorMappings
		ifTrue: [aCanvas originalCanvas]
		ifFalse: [Project current animations transformedCanvasFor: self from: aCanvas].
		
	(Project current animations isAtLeastOneGraphicsAnimationRunningFor: self)
		ifTrue: [self invalidRect: (transformedCanvas clipRect intersect: self fullBounds)].
		
	^ transformedCanvas