`import Ember from 'ember'`
`import layout from '../templates/components/concept-subsection'`

ConceptSubsectionComponent = Ember.Component.extend
  layout: layout
  classNames: ['concept__section']

  title: null

`export default ConceptSubsectionComponent`
