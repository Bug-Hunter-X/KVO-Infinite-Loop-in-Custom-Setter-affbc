To fix this issue, use `willChangeValueForKey:` and `didChangeValueForKey:` within your custom setter to control when KVO notifications are sent. This ensures that KVO notifications only happen when necessary and will prevent any infinite loops.  Here's an example:

```objectivec
@implementation MyClass

- (void)setCustomProperty:(NSString *)newValue {
    [self willChangeValueForKey:@"customProperty"];
    [self willChangeValueForKey:@"anotherProperty"]; // Notify before changing anotherProperty
    _customProperty = newValue;
    _anotherProperty = [newValue uppercaseString]; //Modifying another property.
    [self didChangeValueForKey:@"anotherProperty"];
    [self didChangeValueForKey:@"customProperty"];
}

@end
```
By using `willChangeValueForKey:` and `didChangeValueForKey:`, the KVO notifications are correctly managed, and the infinite loop is avoided.