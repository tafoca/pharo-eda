code generation - command
createCommandClassHashMethod
	| aggregateRootClass |
	aggregateRootClass := self class environment at: self retrieveCommandClassName asSymbol.
	^ self
		compile: 'hash'
		sourceCode: (self generateHashMethodFor: self retrieveCommandAttributes)
		inClass: aggregateRootClass
		classifiedAs: self protocol