Class {
	#name : #SpecTableDataSource,
	#superclass : #Object,
	#instVars : [
		'tablePresenter'
	],
	#category : #'Spec-Table'
}

{ #category : #API }
SpecTableDataSource >> cellColumn: column row: rowIndex [
	| object |
	object := self elementAt: rowIndex.
	
	^column createCellOn: object
]

{ #category : #API }
SpecTableDataSource >> elementAt: rowIndex [
	self subclassResponsibility 
]

{ #category : #API }
SpecTableDataSource >> menuColumn: column row: rowIndex [

	^nil
]

{ #category : #API }
SpecTableDataSource >> newDataSourceMatching: aFTFilter [
	"I am here to help the FTFilterFunction. I take a aFTFilter and I need to return a new dataSource with filtered elements. Each dataSource is responsible of his filtering in order to get a generic mechanism."
	
	"the default action is to just do nothing, return self"
	
	^self
]

{ #category : #API }
SpecTableDataSource >> numberOfRows [
	self subclassResponsibility 
]

{ #category : #API }
SpecTableDataSource >> searchText: aString [
	"search a text and answers a list of elements indexes matching condition. 
	 E.g,
	 	#() 		--> No match 
		#(1) 		--> match first element
		#(1 42) 	--> match elements 1 and 42
			
	Rows not in range will cause the end of the world as we know it :)"
	^ #()
]

{ #category : #accessing }
SpecTableDataSource >> tablePresenter [
	^ tablePresenter
]

{ #category : #accessing }
SpecTableDataSource >> tablePresenter: anObject [
	tablePresenter := anObject
]
