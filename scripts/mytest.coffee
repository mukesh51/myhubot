module.exports = (robot) ->
	robot.hear /badger/i, (res) ->
		res.send "Badgers? BADGERS? We don't need no stinking badgers"


	robot.respond /open the pod bay doors/i, (res) ->
		res.reply "I'm afraid I can't let you do that"

	robot.hear /I like pie/i, (res) ->
		res.emote "makes a freshly backed pie"

	robot.respond /open the (.*) doors/i, (res) ->
    doorType = res.match[1]
    if doorType is "pod bay"
      res.reply "I'm afraid I can't let you do that."
    else
      res.reply "Opening #{doorType} doors"