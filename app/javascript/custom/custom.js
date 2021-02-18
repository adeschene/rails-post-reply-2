// Firing things on 'turbolinks:load' instead of normal 'ready' avoids weird inconsistencies with turbolinks
$(document).on('turbolinks:load', function() {
  // Adds a character limit counter/readout under text areas
  $('textarea#topic_description, textarea#comment_body').characterCounter();

  // Allows the navbar avatar to open a dropdown when hovered over
  $(".dropdown-trigger").dropdown({
    coverTrigger: false,
    hover: true
  });
});
