`import Ember from 'ember'`
`import layout from '../templates/components/concept-simple-textarea'`
`import ResizeTextareaMixin from '../mixins/resize-textarea'`

ConceptSimpleTextareaComponent = Ember.Component.extend ResizeTextareaMixin,
  classNameBindings: ['reference', 'valueSavedAndNotDirty:saved', 'valueSaveFailed:failed', 'dirty:dirty']
  saveAllButton: Ember.inject.service()
  layout: layout

  modelValue: undefined
  newValue: Ember.computed.oneWay 'modelValue'
  showActions: true
  # default value for disableEditing, can be overridden by consumer
  disableEditing: Ember.computed.oneWay 'object.disableEditing'

  referenceObserver: Ember.observer 'reference', ( ->
    ref = @get('reference')
    unless ref then return
    Ember.defineProperty @, 'modelValue',
      Ember.computed.alias "object.#{ref}"

    propertySaved = "object.#{ref}Saved"
    Ember.defineProperty @, 'valueSavedAndNotDirty',
      Ember.computed "dirty", propertySaved, ->
        if @get('dirty') then return false
        return @get("#{propertySaved}")

    propertyFailed = "object.#{ref}Failed"
    Ember.defineProperty @, 'valueSaveFailed',
      Ember.computed.alias propertyFailed

    propertySaving = "object.#{ref}Saving"
    Ember.defineProperty @, 'valueSaving',
      Ember.computed.alias propertySaving
  ).on('init')

  init: ->
    @_super()
    if not @get('object.disableEditing')
      @get('saveAllButton').subscribe(@)

  willDestroyElement: ->
    @_super()
    @get('saveAllButton').unsubscribe(@)

  dirty: Ember.computed 'modelValue', 'newValue', ->
    return @get('modelValue') != @get('newValue')

  saveAllClick: ->
    @saveField(false)
  resetAllClick: ->
    @resetField(false)

  resetField: ->
    @set('newValue', @get('modelValue'))

  saveField: (save) ->
    @sendAction('saveValue', @get('newValue'), @get('modelValue'), save)

  actions:
    saveField: ->
      @saveField(true)

    resetField: ->
      @resetField(true)


`export default ConceptSimpleTextareaComponent`
