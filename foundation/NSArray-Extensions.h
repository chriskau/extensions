#import <Foundation/Foundation.h>

@interface NSArray (Extensions)

// String Extensions
@property (readonly, getter=arrayBySortingStrings) NSArray *sortedStrings;
@property (readonly) NSString *stringValue;

- (NSArray *)arrayBySortingStrings;

// Utility Extensions
- (id)firstObject;

- (NSArray *)uniqueMembers;
- (NSArray *)unionWithArray:(NSArray *)array;
- (NSArray *)intersectionWithArray:(NSArray *)array;

- (NSArray *)map:(SEL)selector;
- (NSArray *)map:(SEL)selector withObject:(id)object;
- (NSArray *)map:(SEL)selector withObject:(id)object1 withObject:(id)object2;

- (NSArray *)collect:(SEL)selector withObject:(id)object1 withObject:(id) object2;
- (NSArray *)collect:(SEL)selector withObject:(id)object1;
- (NSArray *)collect:(SEL)selector;

- (NSArray *)reject:(SEL)selector withObject:(id)object1 withObject:(id)object2;
- (NSArray *)reject:(SEL)selector withObject:(id)object1;
- (NSArray *)reject:(SEL)selector;
@end
