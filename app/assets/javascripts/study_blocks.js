window.StudyBlocks = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    // alert('Hello from Backbone!');
    var decks = new StudyBlocks.Collections.Decks();

    decks.fetch({
      success: function () {
        Backbone.history.start()
      }
    });

    var router = new StudyBlocks.Routers.Router({
      $rootEl: $("main.content"),
      decks: decks
    });

  }
};

$(document).ready(function(){
  StudyBlocks.initialize();
});
