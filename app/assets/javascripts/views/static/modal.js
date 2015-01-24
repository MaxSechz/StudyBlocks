StudyBlocks.Views.Modal = Backbone.CompositeView.extend({
  events: {
    "click": "remove",
    "click .cancel": "remove"
  },

  set: function (view, newClass) {
    this.reset();
    this.addSubview(".modal-content", view).$el.addClass(newClass);
  },

  reset: function () {
    this.$el.removeClass("active").removeClass("form");
  },

  remove: function (event) {
    if ( event && ($( event.target ).hasClass("modal") || $(event.target).hasClass("cancel") )) {
      event.preventDefault();
      this.clear();
    } else if (event === undefined) {
      this.clear();
    }
  },

  clear: function () {
    _.each(this.subviews(".modal-content"), function (subview, selector, subviews) {
      subview.remove();
      delete subviews[selector];
    });

    this.reset();
  }
});
