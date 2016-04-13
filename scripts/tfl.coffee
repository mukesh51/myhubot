# Description:
# Tells the TFL Underground Status
#
# Configuration:
# HUBOT_TFL_URL - Optional openweathermap.org API endpoint to use
#
# Commands:
# tfl status - Gives the Latest Status on TFL Status
#
# Author:
# Mukesh G Chandnani

process.env.HUBOT_TFL_URL ||= 'http://transportapi.com/v3/uk/tube.json?api_key=a473d080efc89c59994d476c85300330&app_id=d19214ec'

module.exports = (robot) ->
	robot.hear /tfl status/i, (msg) ->				
		url = process.env.HUBOT_TFL_URL
		msg.robot.http(url).get() (err, res, body) ->
			if err
				console.log err
			data = JSON.parse(body)
			lines = data.lines

			arr = []
			friendly_name = ''
			status = ''
			for key, value of lines
				#console.log "#{key}"
				for k, v of value
					if k is "friendly_name"
						friendly_name = "#{v} has"
					if k is "status"
						status =  " #{v}."
						arr.push friendly_name + status
			arr2 = "#{arr}"
			console.log "\n"			
			console.log arr2.split(",").join("\n")
			
