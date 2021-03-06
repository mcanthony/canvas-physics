class Observer
	constructor: ->
		@callbacks = {}

	on: (events, callback) =>
		for event in events.split(' ')
			@callbacks = {} unless @callbacks?
			@callbacks[event] = [] unless @callbacks[event]?
			@callbacks[event].push(callback)
		return @

	emit: (event, args...) =>
		return unless @callbacks[event]?
		@callbacks[event].forEach((callback) ->
			callback.apply(null, args)
		)
		return @

module.exports = Observer
