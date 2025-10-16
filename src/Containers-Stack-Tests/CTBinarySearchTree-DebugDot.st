"CTBinarySearchTree - DOT export (file: src/Containers-BinarySearchTree/CTBinarySearchTree-DebugDot.st)"

CTBinarySearchTree>>exportToDotString
    "Return Graphviz DOT string for this tree."
    ^ String streamContents: [:s |
        s nextPutAll: 'digraph CTBST {'; cr.
        s nextPutAll: '  node [shape=record];'; cr.
        self root ifNotNil: [ self root toDotOn: s ].
        s nextPutAll: '}'].
