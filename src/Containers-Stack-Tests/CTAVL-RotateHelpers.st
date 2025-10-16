CTAVL>>rotateLeft: node
    "Return new root of rotated subtree (similar to earlier BST rotations)."
    | r |
    r := node right.
    node right: r left.
    r left ifNotNil: [ r left parent: node ].
    r parent: node parent.
    (node parent ifNotNil: [ (node parent left = node) ifTrue: [ node parent left: r ] ifFalse: [ node parent right: r ] ]).
    r left: node.
    node parent: r.
    ^ r.

CTAVL>>rotateRight: node
    "Symmetric to rotateLeft:."
    | l |
    l := node left.
    node left: l right.
    l right ifNotNil: [ l right parent: node ].
    l parent: node parent.
    (node parent ifNotNil: [ (node parent left = node) ifTrue: [ node parent left: l ] ifFalse: [ node parent right: l ] ]).
    l right: node.
    node parent: l.
    ^ l.
