initialization
setup
	self setupLogging.
	self setupEventAnnouncer.
	self setupProjectionRepository.
	self setupEventProducer.
	self setupEventStore.
	self setupRepositories.
	self setupProjections.
	self setupCommandDispatcher.
	self setupCommandConsumer.
	self setupEventSubscriptions