accessing
loggingLevel: aLevel
	| failed |
	failed := true.
	self debugEnabled: (aLevel = 'debug').
	self infoEnabled: (self debugEnabled or: [ (aLevel = 'info') ]).
	self warningEnabled: (self infoEnabled or: [  (aLevel = 'warning') ]).
	self errorEnabled: (self warningEnabled or: [ (aLevel = 'error' ) ]).
	failed := (self debugEnabled or: [ self infoEnabled or: [ self warningEnabled or: [ self errorEnabled  ] ] ]) not.
	failed
		ifTrue: [ InvalidLoggingLevel signal ]
		ifFalse: [ loggingLevel := aLevel ]