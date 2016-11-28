# Description:
#   Test command.
#
# Commands:
#   hubot mytest <query> - Test Query
#
# Notes:
#   This is just a test

req = (msg, query, cb) ->
  msg.http('https://jsonplaceholder.typicode.com/users')
  .header('User-Agent', 'Mozilla/5.0')
  .get() (err, res, body) ->
    list = body + " " + query
    cb(list)

module.exports = (robot) ->
  robot.respond /mytest (.*)/i, (msg) ->
    req msg, msg.match[2], (list) ->
      out = list
      msg.send out