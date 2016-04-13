# Description:
# Tells the weather
#
# Configuration:
# HUBOT_WEATHER_API_URL - Optional openweathermap.org API endpoint to use
# HUBOT_WEATHER_UNITS - Temperature units to use. 'metric' or 'imperial'
#
# Commands:
# weather in <location> - Tells about the weather in given location
#
# Author:
# Mukesh G Chandnani

process.env.HUBOT_WEATHER_API_URL ||= 'http://api.openweathermap.org/data/2.5/weather?appid=03eef378e0c5dce02dc3d7ca2480e72b'
process.env.HUBOT_WEATHER_UNITS ||= 'imperial'

module.exports = (robot) ->
	robot.hear /weather in (\w+)/i, (msg) ->
		city = msg.match[1]
		query = { units: process.env.HUBOT_WEATHER_UNITS, q: city }
		url = process.env.HUBOT_WEATHER_API_URL
		msg.robot.http(url).query(query).get() (err, res, body) ->
			if err
				console.log err
			data = JSON.parse(body)			
			weather = [ "#{Math.round(data.main.temp)} degrees" ]
			for w in data.weather
				weather.push w.description
			msg.reply "It's #{weather.join(', ')} in #{data.name}, #{data.sys.country}"