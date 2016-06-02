{ Pins } = require "/imports/collections/pins.coffee"
require "/imports/ui/pinDisplay/pinDisplay.coffee"
require "./list.jade"

Template.list.viewmodel
  pins : -> Pins.find {},
    sort :
      dateAdded : -1
    limit : 300
