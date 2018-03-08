Class {
	#name : #SpecTableExample,
	#superclass : #ComposableModel,
	#instVars : [
		'methodTable'
	],
	#category : #'Spec-Table'
}

{ #category : #specs }
SpecTableExample class >> defaultSpec [
	<spec>
	
	^ SpecLayout composed 
			add: #methodTable origin: 0@0 corner: 1@1;
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

	methodTable whenSelectedItemChanged: [:method |
		self inform: method printString].
	methodTable doubleClickAction: [:method |
		self confirm: 'double click on ', method printString ]
]

{ #category : #initialization }
SpecTableExample >> initializeWidgets [

	methodTable := self instantiate: SpecTablePresenter.
	methodTable 
		column: #selector width: 250; 
		column: [:m | m methodClass name] width: 250;
		column: [:m | m package name] width: 50.
	methodTable dataSource: (SpecSimpleTableDataSource on: CompiledMethod allInstances)
]

{ #category : #accessing }
SpecTableExample >> methodTable [
	^ methodTable
]

{ #category : #accessing }
SpecTableExample >> methodTable: anObject [
	methodTable := anObject
]
