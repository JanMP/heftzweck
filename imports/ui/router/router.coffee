require "./layout.jade"
require "/imports/ui/navbar/navbar.jade"
require "/imports/ui/info/info.jade"
require "/imports/ui/list/list.coffee"
require "/imports/ui/myPins/myPins.coffee"
require "/imports/ui/addPin/addPin.coffee"

FlowRouter.route "/",
  name : "home"
  action : ->
    BlazeLayout.render "layout",
      main : "list"

FlowRouter.route "/my-pins",
  name : "myPins"
  action : ->
    BlazeLayout.render "layout",
      main : "myPins"

FlowRouter.route "/add-pin",
  name : "addPin"
  action : ->
    BlazeLayout.render "layout",
      main : "addPin"

FlowRouter.route "/info",
  name : "info"
  action : ->
    BlazeLayout.render "layout",
      main : "info"
