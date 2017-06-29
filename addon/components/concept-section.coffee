`import Ember from 'ember'`
`import layout from '../templates/components/concept-section'`

ConceptSectionComponent = Ember.Component.extend
  layout: layout
  classNames: ['concept__section']

  title: null
  collapsed: true
  collapsable: true

  actions:
    toggleCollapsed: ->
      if @get('collapsable')
        @toggleProperty('collapsed')


`export default ConceptSectionComponent`
