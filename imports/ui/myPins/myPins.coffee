{ Pins } = require "/imports/collections/pins.coffee"
require "/imports/ui/pinDisplay/pinDisplay.coffee"
require "./myPins.jade"

Template.myPins.viewmodel
  pins : ->
    Pins.find
      ownerId : Meteor.userId()
