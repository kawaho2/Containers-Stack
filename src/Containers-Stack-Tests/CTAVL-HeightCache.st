CTAVLNode>>height
    ^ 1 + ((self left ifNil: [ 0 ]) max: (self right ifNil: [ 0 ])).

CTAVLNode>>balanceFactor
    ^ ((self left ifNil: [ 0 ]) ifNotNil: [ self left height ]) - ((self right ifNil: [ 0 ]) ifNotNil: [ self right height ]).
