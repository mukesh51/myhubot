# Description:
#	Prints out this month's ASCII calendar.
#
# Commands:
#	hubot calendar [me] - Print out this month's calendar

child_process = require('child_process')
module.exports = (robot) ->	
	robot.respond /calendar( me)?/i, (msg) ->
		if (process.platform == 'win32')
			#child_process.exec 'c:/windows/system32/control.exe timedate.cpl,Date and Time', (error, stdout,stderr) ->
			#	msg.send(stdout)
		else
			child_process.exec 'cal -h', (error, stdout,stderr) ->
				msg.send(stdout)