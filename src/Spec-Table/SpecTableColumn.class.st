Class {
	#name : #SpecTableColumn,
	#superclass : #Object,
	#instVars : [
		'id',
		'width',
		'cellModelBlock',
		'cellSpecSelector',
		'cellPresenterClass'
	],
	#category : #'Spec-Table'
}

{ #category : #accessing }
SpecTableColumn class >> undefinedColumnWidth [
	"This is a contant that defines a column width is undefined, then the layout will try to arrange 
	 it by itself."
	^ 0
]

{ #category : #'instance creation' }
SpecTableColumn class >> with: aBlockReturingString [

	^self new 
		cellModelBlock: aBlockReturingString
]

{ #category : #'instance creation' }
SpecTableColumn class >> with: aBlock using: aPresenterClass [

	^self new 
		cellModelBlock: aBlock;
		cellPresenterClass: aPresenterClass
]

{ #category : #'instance creation' }
SpecTableColumn class >> with: aBlock using: aPresenterClass width: aNumber [

	^self new 
		cellModelBlock: aBlock;
		cellPresenterClass: aPresenterClass;
		width: aNumber
]

{ #category : #'instance creation' }
SpecTableColumn class >> with: aBlockReturingString width: aNumber [

	^self new 
		cellModelBlock: aBlockReturingString;
		width: aNumber
]

{ #category : #layout }
SpecTableColumn >> acquireWidth: anOwnerWidth [
	^ self widthOrUndefined min: anOwnerWidth
]

{ #category : #accessing }
SpecTableColumn >> cellModelBlock [
	^ cellModelBlock
]

{ #category : #accessing }
SpecTableColumn >> cellModelBlock: anObject [
	cellModelBlock := anObject
]

{ #category : #accessing }
SpecTableColumn >> cellPresenterClass [
	^ cellPresenterClass
]

{ #category : #accessing }
SpecTableColumn >> cellPresenterClass: anObject [
	cellPresenterClass := anObject
]

{ #category : #accessing }
SpecTableColumn >> cellSpecSelector [
	^ cellSpecSelector
]

{ #category : #accessing }
SpecTableColumn >> cellSpecSelector: anObject [
	cellSpecSelector := anObject
]

{ #category : #'cell creation' }
SpecTableColumn >> createCellOn: anObject [

	| cellModel |
	cellModel := cellModelBlock value: anObject.
	^(cellPresenterClass on: cellModel) buildWithSpec: cellSpecSelector
]

{ #category : #accessing }
SpecTableColumn >> id [
	^ id
]

{ #category : #accessing }
SpecTableColumn >> id: anObject [
	id := anObject
]

{ #category : #initialization }
SpecTableColumn >> initialize [
	super initialize.
	
	cellModelBlock := [:rowModel | rowModel asString].
	cellPresenterClass := LabelPresenter.
	cellSpecSelector := #defaultTableCellSpec
]

{ #category : #accessing }
SpecTableColumn >> width [
	^ width
]

{ #category : #accessing }
SpecTableColumn >> width: anObject [
	width := anObject
]

{ #category : #accessing }
SpecTableColumn >> widthOrUndefined [
	^ self width ifNil: [ self class undefinedColumnWidth ]
]
