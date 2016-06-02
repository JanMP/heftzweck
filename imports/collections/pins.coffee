{ Mongo } = require "meteor/mongo"

Pins = new Mongo.Collection "pins"
Pins.schema = new SimpleSchema
  url :
    type : String
  title :
    type : String
  dateAdded :
    type : Date
  ownerId :
    type : String
Pins.attachSchema Pins.schema
exports.Pins = Pins

addPin = new ValidatedMethod
  name : "heftzweck.addPin"
  validate :
    new SimpleSchema
      url :
        type : String
      title :
        type : String
    .validator()
  run : ({ url, title }) ->
    unless @userId
      throw new Meteor.Error "heftzweck.addPin unauthorized"
    Pins.insert
      url : url
      title : title
      dateAdded : new Date()
      ownerId : @userId

removePin = new ValidatedMethod
  name : "heftzweck.removePin"
  validate :
    new SimpleSchema
      id :
        type : String
    .validator()
  run : ({ id }) ->
    unless @userId
      throw new Meteor.Error "heftzweck.removePin unauthorized"
    pin = Pins.findOne id
    unless pin?.ownerId is @userId
      throw new Meteor.Error "heftzweck.removePin not-owner"
    Pins.remove id
