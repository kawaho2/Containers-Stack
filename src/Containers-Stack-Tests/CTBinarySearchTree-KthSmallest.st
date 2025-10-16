CTBinarySearchTree>>kthSmallest: k
    "Return kth smallest value (1-based). Return nil if out of range."
    (k isKindOf: Integer) ifFalse: [ ^ nil ].
    (k <= 0) ifTrue: [ ^ nil ].
    | count result |
    count := 0.
    result := nil.
    self root ifNil: [ ^ nil ].
    self root inOrderDo: [:node |
        count := count + 1.
        (count = k) ifTrue: [ result := node value. ^ result ] ].
    ^ result.
