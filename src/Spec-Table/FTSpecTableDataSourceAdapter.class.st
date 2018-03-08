Class {
	#name : #FTSpecTableDataSourceAdapter,
	#superclass : #FTDataSource,
	#instVars : [
		'dataSource'
	],
	#category : #'Spec-Table'
}

{ #category : #'instance creation' }
FTSpecTableDataSourceAdapter class >> on: aSpecTableDataSource [
	^self new 
		dataSource: aSpecTableDataSource
]

{ #category : #API }
FTSpecTableDataSourceAdapter >> cellColumn: column row: rowIndex [
	^dataSource cellColumn: column row: rowIndex
]

{ #category : #accessing }
FTSpecTableDataSourceAdapter >> dataSource [
	^ dataSource
]

{ #category : #accessing }
FTSpecTableDataSourceAdapter >> dataSource: anObject [
	dataSource := anObject
]

{ #category : #API }
FTSpecTableDataSourceAdapter >> elementAt: rowIndex [
	^dataSource elementAt: rowIndex
]

{ #category : #API }
FTSpecTableDataSourceAdapter >> menuColumn: column row: rowIndex [
	
	^ dataSource menuColumn: column row: rowIndex
]

{ #category : #API }
FTSpecTableDataSourceAdapter >> newDataSourceMatching: aFTFilter [
	| filteredDataSource |
	filteredDataSource := dataSource newDataSourceMatching: aFTFilter.
	filteredDataSource == dataSource ifTrue: [ ^self ].
	
	^self class on: filteredDataSource
]

{ #category : #API }
FTSpecTableDataSourceAdapter >> numberOfRows [
	^dataSource numberOfRows
]

{ #category : #accessing }
FTSpecTableDataSourceAdapter >> searchText: aString [
	^dataSource searchText: aString
]
