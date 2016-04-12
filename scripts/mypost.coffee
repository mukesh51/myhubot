QS = require 'querystring'
 
module.exports = (robot) ->
    robot.respond /post (.+)/i, (msg) ->
        url = 'http://httpbin.org/post'
        data = QS.stringify({'hubot-post': msg.match[1]})
 
        msg.http(url)
            .post(data) (err, res, body) ->
                msg.send body