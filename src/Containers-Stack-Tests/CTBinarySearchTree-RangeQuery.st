CTBinarySearchTree>>elementsBetween: low and: high
    | col |
    col := OrderedCollection new.
    self root ifNil: [ ^ col ].
    self root elementsBetween: low and: high into: col.
    ^ col.

CTBinarySearchTreeNode>>elementsBetween: low and: high into: col
    (self left ifNotNil and: [ self value > low ]) ifTrue: [ self left elementsBetween: low and: high into: col ].
    (self value >= low and: [ self value <= high ]) ifTrue: [ col add: self value ].
    (self right ifNotNil and: [ self value < high ]) ifTrue: [ self right elementsBetween: low and: high into: col ].
