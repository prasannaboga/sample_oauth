$(document).ready ->
  $('#profile-update-link').bind 'ajax:complete', ->
    window.location.reload()
    return
