Class {
	#name : #SpecDataSourceChanged,
	#superclass : #Announcement,
	#instVars : [
		'dataSource'
	],
	#category : #'Spec-Table'
}

{ #category : #accessing }
SpecDataSourceChanged class >> dataSource: aDataSource [

	^self new 
		dataSource: aDataSource 
]

{ #category : #accessing }
SpecDataSourceChanged >> dataSource [
	^ dataSource
]

{ #category : #accessing }
SpecDataSourceChanged >> dataSource: anObject [
	dataSource := anObject
]
