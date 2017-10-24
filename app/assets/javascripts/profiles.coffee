$(document).ready ->
  $('.profile-link-delete').bind 'ajax:complete', ->
    window.location.reload()
    return
