StudyBlocks.Views.Home = Backbone.View.extend({
  tagName: "section",
  className: "home",
  template: JST["static/home"],
  postRender: 'addListener',

  addListener: function () {
    this.$(".pointer").hover(function (e) {
      $(".navbar").toggleClass("hover");
    });
  }
});
