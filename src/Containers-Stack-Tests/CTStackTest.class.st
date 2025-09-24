Class {
	#name : 'CTStackTest',
	#superclass : 'TestCase',
	#instVars : [
		'stack'
	],
	#category : 'Containers-Stack-Tests',
	#package : 'Containers-Stack-Tests'
}

{ #category : 'running' }
CTStackTest >> setUp [
	super setUp.
	stack := CTStack new: 5
]

{ #category : 'tests' }
CTStackTest >> testAlternatingPushPop [

	stack push: 'a'.
	self assert: stack pop equals: 'a'.
	
	stack push: 'b'; push: 'c'.
	self assert: stack pop equals: 'c'.
	
	stack push: 'd'.
	self assert: stack top equals: 'd'.
	self assert: stack size equals: 2
]

{ #category : 'tests' }
CTStackTest >> testAsArray [

	| result |
	stack push: 'first'; push: 'second'; push: 'third'.
	result := stack asArray.
	
	self assert: result equals: #('third' 'second' 'first').
	"Elements from top to bottom"
]

{ #category : 'tests' }
CTStackTest >> testAsOrderedCollection [

	| result |
	stack push: 'a'; push: 'b'; push: 'c'.
	result := stack asOrderedCollection.
	
	self assert: result class equals: OrderedCollection.
	self assert: result asArray equals: #('c' 'b' 'a').
]

{ #category : 'tests' }
CTStackTest >> testCapacity [

	self assert: stack capacity equals: 5.
	stack push: 'test'.
	self assert: stack capacity equals: 5. "Capacity doesn't change"
]

{ #category : 'tests' }
CTStackTest >> testCapacityGrowth [

	| originalCapacity |
	originalCapacity := stack capacity.
	
	1 to: originalCapacity do: [ :i | stack push: i ].
	self assert: stack capacity equals: originalCapacity.
	
	stack push: 'overflow'.
	self assert: stack capacity equals: originalCapacity * 2.
	self assert: stack size equals: originalCapacity + 1
]

{ #category : 'tests' }
CTStackTest >> testCopyCreatesNewObject [

	| copy |
	stack
		push: 'a';
		push: 'b'.
	copy := stack copy.
	self deny: stack identicalTo: copy
]

{ #category : 'tests' }
CTStackTest >> testCopyHasSameContents [

	| copy |
	stack
		push: 'first';
		push: 'second';
		push: 'third'.
	copy := stack copy.

	self assert: copy size equals: stack size.
	self assert: copy top equals: stack top
]

{ #category : 'tests' }
CTStackTest >> testCopyIsIndependent [

	| copy |
	stack push: 'a'; push: 'b'.
	copy := stack copy.

	"Now, modify the original stack"
	stack pop.
	stack push: 'c'.
	
	self assert: copy size equals: 2.
	self assert: copy top equals: 'b'.
	self deny: copy top equals: stack top.
]

{ #category : 'tests' }
CTStackTest >> testDefaultStackCreation [

	| defaultStack |
	defaultStack := CTStack new.

	self assert: defaultStack capacity equals: 10.
	self assert: defaultStack isEmpty.
	self assert: defaultStack size equals: 0
]

{ #category : 'tests' }
CTStackTest >> testDoIteration [

	| elements |
	stack push: 'first'; push: 'second'; push: 'third'.
	elements := OrderedCollection new.
	
	stack do: [ :each | elements add: each ].
	
	self assert: elements asArray equals: #('third' 'second' 'first')
]

{ #category : 'tests' }
CTStackTest >> testDynamicStack [

	| testStack |
	testStack := CTStack new: 2.

	testStack
		push: 'a';
		push: 'b'.
	self assert: testStack capacity equals: 2.

	"Push one more - should double capacity"
	testStack push: 'c'.
	self assert: testStack capacity equals: 4.
	self assert: testStack size equals: 3.
	self assert: testStack top equals: 'c'
]

{ #category : 'tests' }
CTStackTest >> testErrorHandling [

	self should: [ stack pop ] raise: Error.
	self should: [ stack top ] raise: Error.
	
	stack push: 'test'.
	stack pop.
	
	self should: [ stack pop ] raise: Error.
	self should: [ stack top ] raise: Error
]

{ #category : 'tests' }
CTStackTest >> testIsEmpty [

	self assert: stack isEmpty.
	stack push: 'test'.
	self deny: stack isEmpty.
	stack pop.
	self assert: stack isEmpty
]

{ #category : 'tests' }
CTStackTest >> testLIFOOrdering [

	stack push: 'first'; push: 'second'; push: 'third'; push: 'fourth'.
	
	self assert: stack pop equals: 'fourth'.
	self assert: stack pop equals: 'third'.
	self assert: stack pop equals: 'second'.
	self assert: stack pop equals: 'first'
]

{ #category : 'tests' }
CTStackTest >> testLargeCapacityStack [

	| largeStack |
	largeStack := CTStack new: 1000000.
	
	1 to: 1000000 do: [ :i | largeStack push: i ].
	self assert: largeStack isFull.
	self assert: largeStack top equals: 1000000.
	
	1000000 to: 1 by: -1 do: [ :i |
		self assert: largeStack pop equals: i
	].
	self assert: largeStack isEmpty
]

{ #category : 'tests' }
CTStackTest >> testPopAllElements [

	stack
		push: 'a';
		push: 'b';
		push: 'c'.

	stack
		pop;
		pop;
		pop.

	self assert: stack isEmpty.
	self assert: stack size equals: 0
]

{ #category : 'tests' }
CTStackTest >> testPopMultipleElements [

	stack push: 'first'; push: 'second'; push: 'third'.
	
	self assert: stack pop equals: 'third'.
	self assert: stack pop equals: 'second'.
	self assert: stack size equals: 1.
	self assert: stack top equals: 'first'
]

{ #category : 'tests' }
CTStackTest >> testPopSingleElement [

		| element |
	stack push: 'test'.
	element := stack pop.

	self assert: element equals: 'test'.
	self assert: stack isEmpty.
	self assert: stack size equals: 0
]

{ #category : 'tests' }
CTStackTest >> testPushAll [

		| result |
	result := stack pushAll: #('a' 'b' 'c').
	
	self assert: stack size equals: 3.
	self assert: stack top equals: 'c'.
	self assert: result identicalTo: stack
]

{ #category : 'tests' }
CTStackTest >> testPushAllWithEmptyCollection [

	| result |
	result := stack pushAll: #().

	self assert: stack isEmpty.
	self assert: result identicalTo: stack.
]

{ #category : 'tests' }
CTStackTest >> testPushMultipleElements [

	stack
		push: 'first';
		push: 'second';
		push: 'third'.

	self assert: stack size equals: 3.
	self assert: stack top equals: 'third'.	
	self deny: stack isEmpty
]

{ #category : 'tests' }
CTStackTest >> testPushSingleElement [

	stack push: 'first'.

	self assert: stack size equals: 1.
	self deny: stack isEmpty.
	self deny: stack isFull.
	self assert: stack top equals: 'first'
]

{ #category : 'tests' }
CTStackTest >> testRemoveAll [

	stack
		push: 'a';
		push: 'b';
		push: 'c'.
	stack removeAll.

	self assert: stack isEmpty.
	self assert: stack size equals: 0.

	stack push: 'd'.
	self deny: stack isEmpty.
	self assert: stack size equals: 1.
	self assert: stack top equals: 'd'.
]

{ #category : 'tests' }
CTStackTest >> testRemoveAllOnEmptyStack [

	stack removeAll.
	
	self assert: stack isEmpty.
	self assert: stack size equals: 0
]

{ #category : 'tests' }
CTStackTest >> testSearchExistingElement [

	stack push: 'a'; push: 'b'; push: 'c'; push: 'b'.
	
	self assert: (stack search: 'b') equals: 1. "Top element"
	self assert: (stack search: 'c') equals: 2.
	self assert: (stack search: 'a') equals: 4. "Bottom element"
]

{ #category : 'tests' }
CTStackTest >> testSearchNonExistentElement [

	stack push: 'a'; push: 'b'; push: 'c'.
	
	self assert: (stack search: 'x') equals: -1
]

{ #category : 'tests' }
CTStackTest >> testSize [

	self assert: stack size equals: 0.
	stack push: 'a'.
	self assert: stack size equals: 1.
	stack push: 'b'; push: 'c'.
	self assert: stack size equals: 3.
	stack pop.
	self assert: stack size equals: 2
]

{ #category : 'tests' }
CTStackTest >> testStackCreationWithCapacity [
| testStack |
	testStack := CTStack new: 3.

	self assert: testStack capacity equals: 3.
	self assert: testStack isEmpty.
	self assert: testStack size equals: 0
]

{ #category : 'tests' }
CTStackTest >> testStackCreationWithInvalidCapacity [

	self should: [ CTStack new: -1 ] raise: Error.
	self should: [ CTStack new: -10 ] raise: Error
]

{ #category : 'tests' }
CTStackTest >> testStackCreationWithZeroCapacity [

	| zeroStack |
	zeroStack := CTStack new: 0.
	
	self assert: zeroStack capacity equals: 0.
	self assert: zeroStack isEmpty.
	self assert: zeroStack size equals: 0.
	
	zeroStack push: 'first'.
	self assert: zeroStack capacity equals: 10.
	self assert: zeroStack size equals: 1
]

{ #category : 'tests' }
CTStackTest >> testTopWithoutRemoving [

	stack push: 'first'; push: 'second'.
	
	self assert: stack top equals: 'second'.
	self assert: stack size equals: 2.
	self assert: stack top equals: 'second'. "Still there"
]
