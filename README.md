MSWeakMutableSet
================

Behaves exactly like an `NSMutableSet`, but doesn't retain the objects.

## Usage

Just create an `NSMutableSet` object by calling this constructor on `MSWeakMutableSet`:

```objc
#import "MSWeakMutableSet.h"

NSMutableSet *weakSet = [MSWeakMutableSet weakMutableSet];

[weakSet addObject:self]; // This doesn't retain self.
```

## Compatibility
- Doesn't support ARC at the moment. Build with `-fno-objc-arc` if you use ARC.
- Compatible with any version of iOS and Mac OSX.

## License
`MSWeakMutableSet` is available under the MIT license. See the LICENSE file for more info.
