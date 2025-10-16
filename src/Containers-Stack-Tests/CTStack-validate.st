CTStack>>validateStructure
    "Raise an error if internal size differs from element count."
    | count |
    count := 0.
    self do: [:each | count := count + 1 ].
    (count = self size) ifFalse: [ self error: 'Stack internal size mismatch' ].
    ^ true.
