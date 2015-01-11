StudyBlocks.Models.Deck = Backbone.Model.extend({
  urlRoot: "api/decks",

  linkUrl: function (endPoint) {
    endPoint = endPoint || '';
    endPoint = endPoint && "/" + endPoint;
    return "#/decks/" + this.id + endPoint;
  },

  cards: function () {
    if (!this._cards) {
      this._cards = new StudyBlocks.Collections.Cards([], { deck: this });
    } else if (!this.isNew() && this._cards.isEmpty()) {
      this._cards.fetch();
    }

    return this._cards;
  },

  course: function () {
    if (!this._course) {
      this._course = new StudyBlocks.Models.Course({ id: this.course_id});
    } else if (!this.isNew() && this._course.isNew()) {
      this._course.fetch();
    }

    return this._course;
  },

  errors: function (errorField) {
    this._errors = this._errors || {};

    if (!errorField) {
      return this._errors;
    } else if (this._errors[errorField]) {
      return this._errors[errorField];
    }
  },

  parse: function (response) {
    if (response.cards) {
      this.cards().set(response.cards);
      delete response.cards;
    }

    if (response.course) {
      this.course().set(response.course);
      delete response.course;
    }
    return response;
  }
});
