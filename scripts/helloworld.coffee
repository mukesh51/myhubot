module.exports = (robot) ->
	robot.respond /greet/i, (res) ->
		res.send "Hello World!"