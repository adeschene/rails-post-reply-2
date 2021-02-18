$(document).ready(function() {
  // Adds a character limit counter/readout under text areas
  $('textarea#topic_description, textarea#comment_body').characterCounter();

  // Allows the navbar avatar to open a dropdown when clicked
  $(".dropdown-trigger").dropdown({
    coverTrigger: false
  });
});
