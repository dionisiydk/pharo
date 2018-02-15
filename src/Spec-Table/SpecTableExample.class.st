Class {
	#name : #SpecTableExample,
	#superclass : #ComposableModel,
	#instVars : [
		'tableModel'
	],
	#category : #'Spec-Table'
}

{ #category : #specs }
SpecTableExample class >> defaultSpec [
	<spec>
	
	^ SpecLayout composed 
			add: #tablePresenter origin: 0@0 corner: 1@1;
			yourself
]

{ #category : #example }
SpecTableExample class >> open [
	<example>
	
	self new openWithSpec
]

{ #category : #specs }
SpecTableExample class >> title [
	^'Spec table example'
]

{ #category : #initialization }
SpecTableExample >> initializePresenter [

	tableModel whenSelectedItemChanged: [:method |
		self inform: method printString].
	tableModel doubleClickAction: [ self confirm: 'double click?' ]
]

{ #category : #initialization }
SpecTableExample >> initializeWidgets [

	tableModel := self instantiate: SpecTablePresenter.
	tableModel numberOfColumns: 3 withWidths: #(250 250 50).
	tableModel displayBlock: [ :item |  self printMethod: item ].
	tableModel items: CompiledMethod allInstances.
]

{ #category : #initialization }
SpecTableExample >> printItem: item [ 
	
	^item printString
]

{ #category : #initialization }
SpecTableExample >> printMethod: aMethod [ 
	
	^{aMethod selector. aMethod origin name. aMethod package printString}
]

{ #category : #accessing }
SpecTableExample >> tablePresenter [
	^ tableModel
]

{ #category : #accessing }
SpecTableExample >> tablePresenter: anObject [
	tableModel := anObject
]
