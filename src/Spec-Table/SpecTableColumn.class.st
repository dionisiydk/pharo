Class {
	#name : #SpecTableColumn,
	#superclass : #Object,
	#instVars : [
		'id',
		'width',
		'cellModelBlock',
		'cellClass',
		'cellLayoutSelector'
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
	
	cellClass := LabelModel.
	cellLayoutSelector := #defaultSpec
]

{ #category : #accessing }
SpecTableColumn >> transform: anObject [
	^ anObject
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
