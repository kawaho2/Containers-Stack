# Containers-Stack
A High-performance, Array-based Stack implementation providing efficient LIFO (Last In, First Out) operations with dynamic growth and proper bounds checking.

![Pharo Version](https://img.shields.io/badge/Pharo-10+-blue)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## What is a Stack?

A Stack is a linear data structure that follows the LIFO (Last In, First Out) principle. Elements are added and removed from the same end, called the "top" of the stack. Think of it like a stack of plates - you can only add or remove plates from the top.

### Key Benefits
- **O(1) Performance**: Constant time push, pop, and top operations
- **Dynamic Growth**: Automatically expands capacity when needed - no size limits
- **Simple API**: Clean, intuitive interface following standard conventions
- **Robust Error Handling**: Proper stack underflow protection

## Loading 
The following script installs Containers-Stack in Pharo.

```smalltalk
Metacello new
  baseline: 'ContainersStack';
  repository: 'github://pharo-containers/Containers-Stack/src';
  load.
```

## If you want to depend on it 

Add the following code to your Metacello baseline or configuration 

```smalltalk
spec 
   baseline: 'ContainersStack' 
   with: [ spec repository: 'github://pharo-containers/Containers-Stack/src' ].
```

## Quick Start

```smalltalk
"Create a stack (grows automatically when needed)"
stack := CTStack new: 2.
stack capacity.      "Returns 2"

"Push elements - grows beyond initial capacity"
stack push: 'first'; push: 'second'; push: 'third'.
stack capacity.      "Returns 4 (doubled automatically)"
stack size.          "Returns 3"

"LIFO operations"
stack top.           "Returns 'third'"
stack pop.           "Returns 'third'"
stack pop.           "Returns 'second'"
stack pop.           "Returns 'first'"

"Stack is now empty"
stack isEmpty.       "Returns true"
```

## Contributing

This is part of the Pharo Containers project. Feel free to contribute by implementing additional methods, improving tests, or enhancing documentation.