$(document).on 'turbolinks:load',  ->

  active_classes =
    '/users/sign_up': 'registration'
    '/users/sign_in': 'login'
    '/profile': 'profile'
    '/admin': 'admin'
    '/admin/users': 'admin'

  $("li##{active_classes[window.location.pathname]}").addClass('active')
