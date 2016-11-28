# {{ cfg_managed }}
# Description
#   A simple Hubot script that responds to a 'hello'
#
# Configuration:
#   None
#
# Commands:
#   hello {{ name }}
#

module.exports = (robot) ->
  robot.hear /hello @{{ name }}/i, (msg) ->
    msg.send 'Hello! Nice to see you again.'
