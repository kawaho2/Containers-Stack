"Simple test snippet to run in playground"
| t |
t := CTAVL new.
t addAll: #(3 2 1).
"After these insertions tree should be balanced and root should be 2"
(self assert: (t root value = 2)).
