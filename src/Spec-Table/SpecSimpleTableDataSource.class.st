Class {
	#name : #SpecSimpleTableDataSource,
	#superclass : #SpecTableDataSource,
	#instVars : [
		'items'
	],
	#category : #'Spec-Table'
}

{ #category : #'instance creation' }
SpecSimpleTableDataSource class >> on: aCollection [
	^self new 
		items: aCollection
]

{ #category : #API }
SpecSimpleTableDataSource >> elementAt: rowIndex [
	^items at: rowIndex
]

{ #category : #accessing }
SpecSimpleTableDataSource >> items [
	^ items
]

{ #category : #accessing }
SpecSimpleTableDataSource >> items: anObject [
	items := anObject
]

{ #category : #API }
SpecSimpleTableDataSource >> newDataSourceMatching: aFTFilter [
	
	| filteredItems |
	filteredItems := items select: [:each | aFTFilter matches: each printString]. 
	^self class on: filteredItems
]

{ #category : #API }
SpecSimpleTableDataSource >> numberOfRows [
	^items size
]
