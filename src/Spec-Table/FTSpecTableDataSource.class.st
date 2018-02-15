Class {
	#name : #FTSpecTableDataSource,
	#superclass : #FTDataSource,
	#instVars : [
		'tablePresenter'
	],
	#category : #'Spec-Table'
}

{ #category : #'instance creation' }
FTSpecTableDataSource class >> on: aSpecTableModel [
	^self new 
		tablePresenter: aSpecTableModel 
]

{ #category : #accessing }
FTSpecTableDataSource >> cellColumn: column row: rowIndex [
	| object text |
	object := self elementAt: rowIndex.
	
	text := column transform: (tablePresenter wrapItem: object).
	
	^ self createTextCell: text
]

{ #category : #accessing }
FTSpecTableDataSource >> createTextCell: aString [
	| cell |
	cell := FTCellMorph new
		cellInset: 5;
		yourself.
	cell addMorphBack: aString asMorph.
	^ cell
]

{ #category : #private }
FTSpecTableDataSource >> elementAt: rowIndex [
	^tablePresenter listElementAt: rowIndex
]

{ #category : #accessing }
FTSpecTableDataSource >> menuColumn: column row: rowIndex [
	| menu |
	
	menu := UIManager default newMenuIn: self table for: tablePresenter.

	^ tablePresenter menu: menu shifted: false

]

{ #category : #accessing }
FTSpecTableDataSource >> numberOfRows [
	^tablePresenter listSize
]

{ #category : #accessing }
FTSpecTableDataSource >> tablePresenter [
	^ tablePresenter
]

{ #category : #accessing }
FTSpecTableDataSource >> tablePresenter: anObject [
	tablePresenter := anObject
]
