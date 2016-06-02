require "./pinDisplay.jade"
moment = require "moment"

Template.pinDisplay.viewmodel
  formattedDate : ->
    moment @dateAdded()
      .fromNow()
  isOwner : ->
    @_id? and @ownerId() is Meteor.userId()
  remove : ->
    Meteor.call "heftzweck.removePin", id : @_id()
  onRendered : ->
    @image.error =>
      @image
        #.unbind "error"
        .attr "src", "no-image.png"
