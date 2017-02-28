`import Ember from 'ember'`
`import layout from '../templates/components/concept-display'`

ConceptDisplayComponent = Ember.Component.extend
  layout: layout
  classNames: ['object-display']

  cleanStateObserver: Ember.observer('object.id', () ->
    if @cleanState then @cleanState()
  ).on('init')

  cleanState: () ->
    @set('refresh', true)
    Ember.run.later =>
      @set('refresh', false)

      
`export default ConceptDisplayComponent`
