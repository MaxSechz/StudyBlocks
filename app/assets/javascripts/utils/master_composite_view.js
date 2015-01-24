Backbone.CompositeView = Backbone.View.extend({
  addSubview: function (selector, subview) {
    var swapped = true;
    var source = subview.model || subview.collection
    targetId = source.id || source.cid;
    this.subviews(selector)[targetId] &&
    this.subviews(selector)[targetId].remove();
    this.subviews(selector)[targetId] = subview;
    this.attachSubview(selector, subview.render());
    return this;
  },

  attachSubviews: function () {
    var view = this;

    _(this.subviews()).each(function (subviews, selector) {
      view.$(selector).empty();
      _(subviews).each(function (subview) {
        view.attachSubview(selector, subview);
      });
    });
  },

  attachSubview: function (selector, subview) {
    this.$(selector).append(subview.$el);
    subview.delegateEvents();

    if (subview.attachSubviews) {
      subview.attachSubviews();
    }
  },

  remove: function () {
    Backbone.View.prototype.remove.call(this);
    _(this.subviews()).each(function (subviews) {
      _(subviews).each(function (subview) {
        subview.remove();
      });
    });
  },

  removeSubview: function (selector, subview) {
    subview.remove();

    var subviews = this.subviews(selector);
    subviews.splice(subviews.indexOf(subview), 1);
  },

  subviews: function (selector) {
    this._subviews = this._subviews || {};

    if (!selector) {
      return this._subviews;
    }

    this._subviews[selector] = this._subviews[selector] || {};
    return this._subviews[selector];
  },

});
