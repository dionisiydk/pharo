"
A PeelToFirstDebugAction peels the stack back to the second occurance of the currently selected message.

"
Class {
	#name : #PeelToFirstDebugAction,
	#superclass : #DebugAction,
	#category : #'DebuggerActions-Actions'
}

{ #category : #registration }
PeelToFirstDebugAction class >> actionType [
	<contextMenuDebuggingAction>
]

{ #category : #accessing }
PeelToFirstDebugAction >> defaultLabel [

	^ 'Peel to first like this'
]

{ #category : #accessing }
PeelToFirstDebugAction >> defaultOrder [

	^ 45
]

{ #category : #actions }
PeelToFirstDebugAction >> executeAction [

	self session peelToFirstLike: self currentContext 
]

{ #category : #accessing }
PeelToFirstDebugAction >> id [

	^ #peelToFirst
]
