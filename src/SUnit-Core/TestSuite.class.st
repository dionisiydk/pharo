"
This is a Composite of Tests, either TestCases or other TestSuites. The top-level protocol is #run.  This creates aTestResult and sends
	self run: aTestResult.
then ensures that any TestResources made available during the run are reset.  These, and the dependencies protocol, are common between this and TestCase.
"
Class {
	#name : #TestSuite,
	#superclass : #Model,
	#instVars : [
		'tests',
		'resources',
		'name'
	],
	#category : #'SUnit-Core-Kernel'
}

{ #category : #'instance creation' }
TestSuite class >> named: aString [

	^self new
		name: aString;
		yourself
]

{ #category : #dependencies }
TestSuite >> addDependentToHierachy: anObject [
	self addDependent: anObject.
	self tests do: [ :each | each addDependentToHierachy: anObject]
			
]

{ #category : #accessing }
TestSuite >> addTest: aTest [
	self tests add: aTest 
]

{ #category : #accessing }
TestSuite >> addTests: aCollection [ 
	aCollection do: [:eachTest | self addTest: eachTest]
]

{ #category : #announcements }
TestSuite >> announceTest: aTest [
	^ self testSuiteAnnouncer announce: (TestAnnouncement with: aTest).
]

{ #category : #running }
TestSuite >> debug [
	self setUp.
	[
		self tests do: [:each | 
					each debug.
					self announceTest: each.
					self changed: each.
		]
	] ensure:[ 
		self tearDown. 
	].


]

{ #category : #accessing }
TestSuite >> defaultResources [
	^self tests
		inject: OrderedCollection new
		into:
			[:coll :testCase |
			testCase resources do:
				[:each |
				(coll includes: each) ifFalse: [coll add: each]].
			coll]
]

{ #category : #accessing }
TestSuite >> name [

	^name
]

{ #category : #accessing }
TestSuite >> name: aString [

	name := aString
]

{ #category : #dependencies }
TestSuite >> removeDependentFromHierachy: anObject [
	self removeDependent: anObject.
	self tests do: [ :each | each removeDependentFromHierachy: anObject]
			
]

{ #category : #running }
TestSuite >> resourceClass [

	^ TestResource
]

{ #category : #accessing }
TestSuite >> resources [
	resources isNil ifTrue: [resources := self defaultResources].
	^resources
]

{ #category : #accessing }
TestSuite >> resources: someOrderedTestResourceClasses [
	"The parameter should understand reverseDo: and should not contain duplicates."

	resources := someOrderedTestResourceClasses
]

{ #category : #running }
TestSuite >> resultClass [

	^ TestAsserter classForTestResult
]

{ #category : #running }
TestSuite >> run [
	| result |
	result := self resultClass new.
	self run: result.
	^result
]

{ #category : #running }
TestSuite >> run: aResult [
	CurrentExecutionEnvironment runTestsBy: [
		self runUnmanaged: aResult ]
]

{ #category : #running }
TestSuite >> runUnmanaged: aResult [
	self setUp.
	[ self tests
		do: [ :each | 
			each run: aResult.
			self announceTest: each.
			self changed: each ] ]
		ensure: [ self tearDown ]
]

{ #category : #running }
TestSuite >> setUp [
	self resources do: [:each |
			each isAvailable ifFalse: [ each signalInitializationError ]].
]

{ #category : #announcements }
TestSuite >> subscribe: aAnnouncement do: aBlock [
	self testSuiteAnnouncer subscribe: aAnnouncement do: aBlock
]

{ #category : #running }
TestSuite >> tearDown [
	self resourceClass resetResources: self resources.
]

{ #category : #announcements }
TestSuite >> testSuiteAnnouncer [
	^ self announcer
]

{ #category : #accessing }
TestSuite >> tests [
	tests isNil ifTrue: [tests := OrderedCollection new].
	^tests
]

{ #category : #announcements }
TestSuite >> unsubscribe: anAnnouncementClass [ 
	self testSuiteAnnouncer unsubscribe: anAnnouncementClass.
]
