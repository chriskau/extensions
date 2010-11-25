#import <Foundation/Foundation.h>

@interface NSMutableArray (Extensions)

@property (readonly, getter=reverse) NSMutableArray *reversed;

// Utility Extensions
- (NSMutableArray *)removeFirstObject;
- (NSMutableArray *)reverse;
- (NSMutableArray *)scramble;

// Stack and Queue Extensions
- (NSMutableArray *)pushObject:(id)object;
- (NSMutableArray *)pushObjects:(id)object,...;
- (id)popObject;
- (id)pullObject;

- (NSMutableArray *)push:(id)object;
- (id)pop;
- (id)pull;
@end
