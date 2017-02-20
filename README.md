Ember object display
======

Several components to easily declare how to display a concept object.

Usage
---

Nest the block components to declare the view of a concept object. The components are described below. The list below shows a suggested nesting. Of course, all blocks can also be filled in with plain HTML or custom components.

* `concept-display object`
	Wrapper for the view for a concept. Observes which concept `object` is selected and reloads the view on change.

	* `concept-title-bar`
	The title bar. Fill with title bar widgets, and the title in a `h1` header.

	* `concept-sections`
	Wrapper for the body sections.

		* `concept-section title collapsed`
		A collapsible section with a title.

			* `concept-subsection title`
			A subsection with a title.

				* `concept-textarea object reference`
				An editable text area for `object.[reference]` with save buttons. Not editable iff `object.disableEditing`. Registers to `saveAllButton` service.



Deprecation note
---

This add-on underwent a huge refactoring to make working with it a lot simpler. The deprecated classes are kept for now as a reference, just in case not everything was ported. Do not use them to implement new functionality.
