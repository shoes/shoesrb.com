$(document).ready(function() {
  $('ul.nav a[href="'+ window.location.pathname +'"]').parent().addClass('active');
});
