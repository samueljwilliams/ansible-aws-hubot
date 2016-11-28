# Description:
#   None
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot beer me - Grab me a beer
#
# Author:
#  houndbee

beers = [
  "http://www.foodandwine.com/fwx/sites/default/files/trump-and-beer-fwx.jpg",
  "http://static6.businessinsider.com/image/5668042add089548678b4681/craft-beer-maker-brewdog-just-gave-donald-trump-free-shares.jpg",
  "https://thenypost.files.wordpress.com/2014/10/usa-whitehouse-beer-1.jpg"
]

module.exports = (robot) ->
  robot.hear /.*(beer me).*/i, (msg) ->
    msg.send msg.random beers
