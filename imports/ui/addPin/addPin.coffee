require "./addPin.jade"

Template.addPin.viewmodel
  url : ViewModel.property.string.notBlank
  title : ViewModel.property.string.notBlank
  pin : ->
    url : @url()
    title : @title()
    dateAdded : new Date()
    ownerId : Meteor.userId()
  valid : ->
    @url.valid() and @title.valid()
  anyValid : ->
    @url.valid() or @title.valid()
  submit : (event) ->
    event.preventDefault()
    Meteor.call "heftzweck.addPin",
      url : @url()
      title : @title()
    ,
      (error, result) =>
        if error
          alert error.message
        else
          @reset()
          FlowRouter.go "/my-pins"
