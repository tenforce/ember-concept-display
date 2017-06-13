`import Ember from 'ember'`
`import layout from '../templates/components/concept-simple-textarea'`
`import ResizeTextareaMixin from '../mixins/resize-textarea'`

ConceptSimpleTextareaComponent = Ember.Component.extend ResizeTextareaMixin,
  saveAllButton: Ember.inject.service()
  layout: layout

  reference: undefined

  boundValue: undefined

  init: ->
    @_super()
    ref = 'object.' + @get('reference')
    value = @get(ref)
    @set 'boundValue', value
    if not @get('object.disableEditing')
      @get('saveAllButton').subscribe(@)
      Ember.defineProperty @, "dirty",
        Ember.computed 'boundValue', ref, ->
          # look at the values as "" if undefined
          value = @get(ref) or ""
          boundValue = @get('boundValue') or ""
          boundValue != value

  saveAllClick: ->
    @saveField()

  resetField: ->
    ref = 'object.' + @get('reference')
    value = @get(ref)
    @set('boundValue', value)

  saveField: ->
    boundValue = @get('boundValue')
    @get('object').set(@get('reference'), boundValue)

  actions:
    saveField: ->
      @saveField()
      @get('object').save()

    resetField: ->
      @resetField()

  disableEditing: Ember.computed.alias 'object.disableEditing'
  showActions: Ember.computed 'dirty', 'object.isUnderCreation', ->
    if @get('object.isUnderCreation') then return false
    if @get('dirty') then return true
    return false

`export default ConceptSimpleTextareaComponent`
