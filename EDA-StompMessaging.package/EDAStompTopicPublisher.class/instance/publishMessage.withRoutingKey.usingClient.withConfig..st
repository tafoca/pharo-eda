API
publishMessage: aMessage withRoutingKey: aRoutingKeyString usingClient: aClient withConfig: config
	| sendFrame |
	self logInit: aMessage usingClient: aClient withConfig: config.
	aClient isConnected
		ifFalse: [ aClient open ].
	[ 
	sendFrame := StampSendFrame new.
	sendFrame destination: (config destinationWithRoutingKey: aRoutingKeyString). 
	sendFrame text: aMessage.
	sendFrame persistent: config durable.
	aClient writeWithReceipt: sendFrame ]
		ensure: [ aClient close ].
	self logFinish: aMessage usingClient: aClient withConfig: config