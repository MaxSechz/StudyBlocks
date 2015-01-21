Backbone.CollectionView = Backbone.CompositeView.extend({
  selector: '',
  subModelViewName: '',
  renderThis: {
    model: ''
  },
  options: {},
  preRenderCallback: '',
  postRenderCallback: '',

  renderObject: function () {
    var renderObject = {};
    for (var attr in this.renderThis) {
      var attrVal = this.renderThis[attr];
      renderObject[attr] = this[attrVal];
    }
    return renderObject;
  },

  subModelView: function (obj) {
    var realOptions = {};
    for (var attr in this.options) {
      obj[attr] = this.options[attr];
    }
    return new StudyBlocks.Views[this.subModelViewName](obj);
  },

  render: function () {
    this.preRenderCallback && this[this.preRenderCallback]();
    var content = this.template(this.renderObject());
    this.$el.html(content);
    this.renderCollection();
    this.postRenderCallback && this[this.postRenderCallback]();
    return this;
  },

  renderCollection: function () {
    var keys = [];
    for (var i = 0; i < this.collection.models.length; i++) {
      var modelId = this.addModelView(this.collection.models[i]);
      modelId && keys.push(modelId.toString());
    }
    var trash = _.omit(this.subviews(this.selector), keys);
    _.each(trash, function (subview) {
      subview.remove();
    });
    this.subviews()[this.selector] = _.pick(this.subviews(this.selector), keys);
  },

  addModelView: function (subModel) {
    if (this.subModelView === undefined) {
      return;
    }
    var subView = this.subModelView({ model: subModel });
    this.addSubview(this.selector, subView);
    return subModel.id || subModel.cid;
  },
});
