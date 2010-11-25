#import "NSCharacterSet-Extensions.h"

@implementation NSCharacterSet (Extensions)

// The ranges of unicode characters allowed, as specified in the W3 XML specification:
// Char ::= #x9 | #xA | #xD | [#x20-#xD7FF] | [#xE000-#xFFFD] | [#x10000-#x10FFFF]
//
// See: http://www.w3.org/TR/2000/REC-xml-20001006#NT-Char

+ (id)illegalXMLCharacterSet
{
    static NSCharacterSet *invalidXMLCharacterSet = nil;

    if (invalidXMLCharacterSet == nil) {
        NSMutableCharacterSet *xmlCharacterSet = [[[NSMutableCharacterSet alloc] init] autorelease];
        [xmlCharacterSet addCharactersInRange:NSMakeRange(0x9, 1)];
        [xmlCharacterSet addCharactersInRange:NSMakeRange(0xA, 1)];
        [xmlCharacterSet addCharactersInRange:NSMakeRange(0xD, 1)];
        [xmlCharacterSet addCharactersInRange:NSMakeRange(0x20, 0xD7FF - 0x20)];
        [xmlCharacterSet addCharactersInRange:NSMakeRange(0xE000, 0xFFFD - 0xE000)];
        [xmlCharacterSet addCharactersInRange:NSMakeRange(0x10000, 0x10FFFF - 0x10000)];

        invalidXMLCharacterSet = [[xmlCharacterSet invertedSet] retain];
    }

    return invalidXMLCharacterSet;
}

@end
