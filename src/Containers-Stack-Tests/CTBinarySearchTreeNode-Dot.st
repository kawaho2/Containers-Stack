CTBinarySearchTreeNode>>toDotOn: stream
    | n |
    n := 'n', self identityHash asString.
    stream nextPutAll: '  ', n, ' [label="', self value printString, '"];'; cr.
    self left ifNotNil: [
        stream nextPutAll: '  ', n, ' -> n', self left identityHash asString, ';'; cr.
        self left toDotOn: stream ].
    self right ifNotNil: [
        stream nextPutAll: '  ', n, ' -> n', self right identityHash asString, ';'; cr.
        self right toDotOn: stream ].
