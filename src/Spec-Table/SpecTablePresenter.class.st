Class {
	#name : #SpecTablePresenter,
	#superclass : #ListPresenter,
	#instVars : [
		'handlesDoubleClick',
		'doubleClick',
		'columns',
		'dataSource'
	],
	#category : #'Spec-Table'
}

{ #category : #specs }
SpecTablePresenter class >> adapterName [

	^ #SpecTableAdapter
]

{ #category : #specs }
SpecTablePresenter class >> defaultSpec [
	<spec: #default>
	
	^ #(SpecTableAdapter
		adapt: #(model))
]

{ #category : #example }
SpecTablePresenter class >> example [
	| example |
	example := self new.
	example
		column: [ :each | each printString ];
		dataSource: (SpecSimpleTableDataSource on: (1 to: 10));
		openWithSpec.
	^ example
]

{ #category : #example }
SpecTablePresenter class >> exampleMultipleSelection [
	| example |
	example := self new.
	example
		column: [ :each | each printString ];
		dataSource: (SpecSimpleTableDataSource on: (1 to: 10));
		whenSelectionChanged: [ :selection | selection logCr ];
		beMultipleSelection;
		openWithSpec.
	^ example
]

{ #category : #accessing }
SpecTablePresenter >> addColumn: aSpecTableColumn [
	
	aSpecTableColumn id: columns size + 1.
	columns add: aSpecTableColumn.
	^aSpecTableColumn
]

{ #category : #api }
SpecTablePresenter >> column: aBlockReturningString [

	| column |
	column := SpecTableColumn with: aBlockReturningString.
	^self addColumn: column
]

{ #category : #api }
SpecTablePresenter >> column: aBlockReturningString using: aPresenterClass [

	| column |
	column := SpecTableColumn with: aBlockReturningString using: aPresenterClass.
	^self addColumn: column
]

{ #category : #api }
SpecTablePresenter >> column: aBlockReturningString using: aPresenterClass width: aNumber [

	| column |
	column := SpecTableColumn with: aBlockReturningString using: aPresenterClass width: aNumber.
	^self addColumn: column
]

{ #category : #api }
SpecTablePresenter >> column: aBlockReturningString width: aNumber [

	| column |
	column := SpecTableColumn with: aBlockReturningString width: aNumber.
	^self addColumn: column
]

{ #category : #accessing }
SpecTablePresenter >> columns [
	^ columns
]

{ #category : #morphic }
SpecTablePresenter >> createMorphicWidget [
	| table |
	table := FTTableMorph new
			dataSource: (FTSpecTableDataSourceAdapter on: dataSource);
			hideColumnHeaders;
			beResizable;
			columns: self columns;
			setMultipleSelection: self multiSelection;
			dragEnabled:	self dragEnabled ;
			dropEnabled:	self dropEnabled ; 	
			setBalloonText: self help; 
			hResizing: 	#spaceFill;
			vResizing: 	#spaceFill;
			selectRowIndex: 1;
			enableFilter: FTSubstringFilter;			
			explicitFunction;
			yourself.
	
	table announcer when: FTStrongSelectionChanged send: #doubleClick: to: self.
	table announcer when: FTSelectionChanged send: #selectionChanged: to: self.
	^table
]

{ #category : #accessing }
SpecTablePresenter >> dataSource [
	^ dataSource
]

{ #category : #accessing }
SpecTablePresenter >> dataSource: anObject [
	dataSource := anObject.
	dataSource tablePresenter: self
]

{ #category : #api }
SpecTablePresenter >> doubleClick: event [

	doubleClick value cull: event
]

{ #category : #api }
SpecTablePresenter >> doubleClickAction [
	"<api: #inspect>"
	"Return the block evaluated on double click"
	
	^ doubleClick value
]

{ #category : #api }
SpecTablePresenter >> doubleClickAction: aBlock [
	"<api: #block getter:#doubleClickAction registration: #whenDoubleClickActionChanged:>"
	"Set the block evaluated on double click."
	
	doubleClick value: aBlock
]

{ #category : #api }
SpecTablePresenter >> handlesDoubleClick [

	^ handlesDoubleClick value
]

{ #category : #api }
SpecTablePresenter >> handlesDoubleClick: aBoolean [
	"<api: #block getter:#handlesDoubleClick registration: #whenHandlesDoubleClickChanged:>"
	"Enable or disable double click on the list."
	
	handlesDoubleClick value: aBoolean
]

{ #category : #initialization }
SpecTablePresenter >> initialize [
	super initialize.
	columns := OrderedCollection new
]

{ #category : #initialization }
SpecTablePresenter >> initializeValueHolders [

	super initializeValueHolders.

	handlesDoubleClick := false asValueHolder.
	doubleClick := [  ] asValueHolder.

]

{ #category : #private }
SpecTablePresenter >> listElementAt: anIndex [
	anIndex = 0 ifTrue: [ ^nil ].
	^dataSource elementAt: anIndex
]

{ #category : #accessing }
SpecTablePresenter >> numberOfColumns: aNumber [
	columns := ((1 to: aNumber) collect: [ :index | FTArrayIndexColumn index: index ] )
]

{ #category : #accessing }
SpecTablePresenter >> numberOfColumns: aNumber withWidths: widths [
	columns := ((1 to: aNumber) collect: [ :index | 
		FTArrayIndexColumn index: index width: (widths at: index) ] )
]

{ #category : #private }
SpecTablePresenter >> prepareForFilteredDataSourceWith: items [

	listHolder := items asValueHolder.
	listHolder whenChangedDo: [ self refreshListItems ].
	listItemsCache := nil
]

{ #category : #initialization }
SpecTablePresenter >> registerEvents [
	super registerEvents.
	handlesDoubleClick whenChangedDo: [ :bool | self changed: { #handlesDoubleClick . bool } ].

]

{ #category : #morphic }
SpecTablePresenter >> selectionChanged: aSelectionChanged [

	aSelectionChanged oldSelectedRowIndexes do: [ :each | 
		self setSelectionStateFor: each at: false ].
	
	aSelectionChanged newSelectedRowIndexes do: [ :each | 
		self  setSelectionStateFor: each at: true ].
	
	self setIndex: (aSelectionChanged newSelectedRowIndexes 
			ifNotEmpty: [ :indexes | indexes first ]
			ifEmpty: [ 0 ]).
			
	aSelectionChanged newSelectedRowIndexes ifEmpty: [self resetListSelection]
]
