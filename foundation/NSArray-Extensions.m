#import "NSArray-Extensions.h"

#import "NSObject-Extensions.h"
#import <time.h>
#import <stdarg.h>

#pragma mark String Extensions

@implementation NSArray (Extensions)

- (NSArray *)arrayBySortingStrings
{
	NSMutableArray *sort = [NSMutableArray arrayWithArray:self];
	for (id eachitem in self)
		if (![eachitem isKindOfClass:[NSString class]])	[sort removeObject:eachitem];
	return [sort sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

- (NSString *) stringValue
{
	return [self componentsJoinedByString:@" "];
}


#pragma mark Utility Extensions

- (id)firstObject
{
	return [self objectAtIndex:0];
}

- (NSArray *)uniqueMembers
{
	NSMutableArray *copy = [self mutableCopy];
	for (id object in self) {
		[copy removeObjectIdenticalTo:object];
		[copy addObject:object];
	}
	return [copy autorelease];
}

- (NSArray *)unionWithArray:(NSArray *)anArray
{
	if (!anArray) return self;
	return [[self arrayByAddingObjectsFromArray:anArray] uniqueMembers];
}

- (NSArray *)intersectionWithArray:(NSArray *)anArray
{
	NSMutableArray *copy = [[self mutableCopy] autorelease];
	for (id object in self) {
		if (![anArray containsObject:object])
			[copy removeObjectIdenticalTo:object];
	}
	return [copy uniqueMembers];
}

// A la LISP, will return an array populated with values
- (NSArray *)map:(SEL)selector withObject:(id)object1 withObject:(id)object2
{
	NSMutableArray *results = [NSMutableArray array];
	for (id eachitem in self) {
		if (![eachitem respondsToSelector:selector]) {
			[results addObject:[NSNull null]];
			continue;
		}

		id riz = [eachitem objectByPerformingSelector:selector withObject:object1 withObject:object2];
		if (riz)
			[results addObject:riz];
		else
			[results addObject:[NSNull null]];
	}
	return results;
}

- (NSArray *)map:(SEL)selector withObject:(id)object1
{
	return [self map:selector withObject:object1 withObject:nil];
}

- (NSArray *)map:(SEL)selector
{
	return [self map:selector withObject:nil];
}

- (NSArray *)collect:(SEL)selector withObject:(id)object1 withObject:(id)object2
{
	NSMutableArray *riz = [NSMutableArray array];
	for (id eachitem in self) {
		BOOL yorn;
		NSValue *eachriz = [eachitem valueByPerformingSelector:selector withObject:object1 withObject:object2];
		if (strcmp([eachriz objCType], "c") == 0)  {
			[eachriz getValue:&yorn];
			if (yorn) [riz addObject:eachitem];
		}
	}
	return riz;
}

- (NSArray *)collect:(SEL)selector withObject:(id)object1
{
	return [self collect:selector withObject:object1 withObject:nil];
}

- (NSArray *)collect:(SEL)selector
{
	return [self collect:selector withObject:nil withObject:nil];
}

- (NSArray *)reject:(SEL)selector withObject:(id)object1 withObject:(id)object2
{
	NSMutableArray *riz = [NSMutableArray array];
	for (id eachitem in self) {
		BOOL yorn;
		NSValue *eachriz = [eachitem valueByPerformingSelector:selector withObject:object1 withObject:object2];
		if (strcmp([eachriz objCType], "c") == 0) {
			[eachriz getValue:&yorn];
			if (!yorn) [riz addObject:eachitem];
		}
	}
	return riz;
}

- (NSArray *)reject:(SEL)selector withObject:(id)object1
{
	return [self reject:selector withObject:object1 withObject:nil];
}

- (NSArray *)reject:(SEL)selector
{
	return [self reject:selector withObject:nil withObject:nil];
}
@end
