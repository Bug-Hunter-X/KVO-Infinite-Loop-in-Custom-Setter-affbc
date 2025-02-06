# Objective-C KVO Infinite Loop Bug
This repository demonstrates a subtle bug involving Key-Value Observing (KVO) in Objective-C.  The bug arises from a custom setter modifying another observed property, leading to an infinite loop.  The solution demonstrates how to avoid this issue.

## Bug Description
The `BuggyKVO.m` file contains a class with a custom setter. When a property is changed, it triggers KVO notifications. The custom setter also modifies a second property which also has KVO observers registered. This creates a cyclical chain of notifications leading to an infinite loop and a program crash.

## Solution
The `FixedKVO.m` file provides a corrected implementation that prevents the infinite loop. The solution involves using `willChangeValueForKey:` and `didChangeValueForKey:` to control the KVO notification process, ensuring that only one notification is triggered per change, and prevents infinite recursion. 