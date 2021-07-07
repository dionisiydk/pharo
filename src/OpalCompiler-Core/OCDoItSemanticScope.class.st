"
I am a root of hierarchy of scopes representing the various kindos of DoIt expressions
"
Class {
	#name : #OCDoItSemanticScope,
	#superclass : #OCSemanticScope,
	#category : #'OpalCompiler-Core-Semantics'
}

{ #category : #testing }
OCDoItSemanticScope class >> isAbstract [ 
	^self = OCDoItSemanticScope 
]

{ #category : #converting }
OCDoItSemanticScope >> asDoItScope [
	^self
]

{ #category : #'code compilation' }
OCDoItSemanticScope >> compileMethodFromASTBy: aCompiler [
	^aCompiler compileDoItFromAST
]

{ #category : #'code evaluation' }
OCDoItSemanticScope >> evaluateDoIt: doItMethod [
	self subclassResponsibility 
]

{ #category : #testing }
OCDoItSemanticScope >> isDoItScope [ 
	^true
]

{ #category : #parsing }
OCDoItSemanticScope >> parseASTBy: aParser [
	^aParser parseExpression
]

{ #category : #'code compilation' }
OCDoItSemanticScope >> transformDoItExpressionToMethodAST: expressionAST [
	self subclassResponsibility 
]
