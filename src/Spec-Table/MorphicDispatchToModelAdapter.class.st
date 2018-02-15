Class {
	#name : #MorphicDispatchToModelAdapter,
	#superclass : #MorphicListAdapter,
	#category : #'Spec-Table'
}

{ #category : #factory }
MorphicDispatchToModelAdapter >> buildWidget [

	^ self model createMorphicWidget
]

{ #category : #'as yet unclassified' }
MorphicDispatchToModelAdapter >> doubleClick: event [

	^ self model doubleClick: event
]

{ #category : #'widget API' }
MorphicDispatchToModelAdapter >> getIconFor: anItem [

	^ self model getIconFor: anItem
]

{ #category : #'as yet unclassified' }
MorphicDispatchToModelAdapter >> wrapItem: anObject [

	^ self model wrapItem: anObject
]
