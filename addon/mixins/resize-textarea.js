import Ember from 'ember';

// this mixin is for resizing the textareas depending on the size of text inside the textarea
export default Ember.Mixin.create({
    didInsertElement: function() {
        this._super();
        Ember.run.later(function() {
            Ember.$.each(Ember.$('textarea'), function() {
                // this resizes the height of the textarea
                // and removes the rows attribute, because it is only needed on init
                var offset = this.offsetHeight - this.clientHeight;
                var resizeTextarea = function(el) {
                    Ember.$(el).css('height', 'auto').css('height', el.scrollHeight + offset);
                };
                resizeTextarea(this);
                Ember.$(this).on('keyup input', function() {
                    Ember.$(this).removeAttr('rows');
                    resizeTextarea(this);
                });
            });
        });
    }
});
