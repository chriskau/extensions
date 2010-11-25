#import "NSArray-Extensions.h"

#import "NSObject-Extensions.h"
#import <time.h>
#import <stdarg.h>


#pragma mark Utility Extensions

@implementation NSMutableArray (UtilityExtensions)

- (NSMutableArray *) reverse
{
	for (int i=0; i<(floor([self count]/2.0)); i++)
		[self exchangeObjectAtIndex:i withObjectAtIndex:([self count]-(i+1))];
	return self;
}

// Make sure to run srandom([[NSDate date] timeIntervalSince1970]); or similar somewhere in your program
- (NSMutableArray *)scramble
{
	for (int i=0; i<([self count]-2); i++)
		[self exchangeObjectAtIndex:i withObjectAtIndex:(i+(random()%([self count]-i)))];
	return self;
}

- (NSMutableArray *)removeFirstObject
{
	[self removeObjectAtIndex:0];
	return self;
}

#pragma mark Stack and Queue Extensions

- (id)popObject
{
    if ([self count] == 0) return nil;

    id lastObject = [[[self lastObject] retain] autorelease];
    [self removeLastObject];
    return lastObject;
}

- (NSMutableArray *)pushObject:(id)object
{
    [self addObject:object];
	return self;
}

- (NSMutableArray *)pushObjects:(id)object,...
{
	if (!object) return self;
	id obj = object;
	va_list objects;
	va_start(objects, object);
	do {
		[self addObject:obj];
		obj = va_arg(objects, id);
	} while (obj);
	va_end(objects);
	return self;
}

- (id)pullObject
{
	if ([self count] == 0) return nil;

	id firstObject = [[[self objectAtIndex:0] retain] autorelease];
	[self removeObjectAtIndex:0];
	return firstObject;
}

- (NSMutableArray *)push:(id)object
{
	return [self pushObject:object];
}

- (id)pop
{
	return [self popObject];
}

- (id)pull
{
	return [self pullObject];
}
@end
