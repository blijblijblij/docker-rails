# Based on the blog post "Turbolinks — How to organize your Javascript code"
# https://medium.com/@coorasse/turbolinks-how-to-organize-your-javascript-code-df83d59c0886

class @Init
  constructor: ->
    @startup_modules()
    @startup_controller_specific_code()

  startup_modules: ->
    new TextAreaAutosize()
    new FormValidator()
    new InfiniteScrolling()

  startup_controller_specific_code: ->
    klass_name = $('body').data('js-class')
    if 'function' is typeof window[klass_name]
      klass = window[klass_name]
      new klass()

$(document).on 'turbolinks:load', ->
  new Init()