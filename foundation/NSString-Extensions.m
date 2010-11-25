#import "NSString-Extensions.h"

@implementation NSString (Extensions)

- (BOOL)contains:(NSString *)aString
{
    if ([self rangeOfString:aString].location == NSNotFound)
        return NO;

    return YES;
}

- (BOOL)appendToFile:(NSString *)path usingEncoding:(NSStringEncoding)encoding
{
    NSData *encoded = [self dataUsingEncoding:encoding];

    return [encoded appendToFile:path];
}

- (NSString *)stringByReplacingPercentEscapes
{
    NSString *string = (NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, NULL, CFSTR("?=&+"), kCFStringEncodingUTF8);
    return [string autorelease];
}

@end
