Class {
	#name : #SpecTableColumn,
	#superclass : #Object,
	#instVars : [
		'id',
		'width',
		'cellClass',
		'cellSpecSelector'
	],
	#category : #'Spec-Table'
}

{ #category : #'instance creation' }
SpecTableColumn class >> id: anObject [
	^ self new
		id: anObject;
		yourself
]

{ #category : #accessing }
SpecTableColumn class >> undefinedColumnWidth [
	"This is a contant that defines a column width is undefined, then the layout will try to arrange 
	 it by itself."
	^ 0
]

{ #category : #layout }
SpecTableColumn >> acquireWidth: anOwnerWidth [
	^ self widthOrUndefined min: anOwnerWidth
]

{ #category : #'cell creation' }
SpecTableColumn >> createCellOn: anObject [

	^(cellClass on: anObject) buildWithSpec: cellSpecSelector
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
	
	cellClass := LabelPresenter.
	cellSpecSelector := #defaultSpec
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
