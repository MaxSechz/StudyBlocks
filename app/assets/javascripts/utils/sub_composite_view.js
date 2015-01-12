Backbone.CollectionView = Backbone.CompositeView.extend({
  selector: '',
  subModelViewName: '',
  renderThis: {
    model: ''
  },

  renderObject: function () {
    var renderObject = {};
    for (var attr in this.renderThis) {
      var attrVal = this.renderThis[attr];
      renderObject[attr] = this[attrVal];
    }
    return renderObject;
  },

  subModelView: function (obj) {
    return new StudyBlocks.Views[this.subModelViewName](obj);
  },

  render: function () {
    console.log(this.model)
    var content = this.template(this.renderObject());
    this.$el.html(content);
    this.renderCollection();
    return this;
  },

  renderCollection: function () {
    this.collection.each(this.addModelView.bind(this));
  },

  addModelView: function (subModel) {
    if (this.subModelView === undefined) {
      return;
    }
    var subView = this.subModelView({ model: subModel });
    this.addSubview(this.selector, subView);
  },
});
