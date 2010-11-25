#import "NSData-Extensions.h"

@implementation NSData (Extensions)

- (BOOL)appendToFile:(NSString *)path
{
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:path];
    if (fileHandle == nil)
        return [self writeToFile:path atomically:YES];

    [fileHandle truncateFileAtOffset:[fileHandle seekToEndOfFile]];

    [fileHandle writeData:self];
    [fileHandle closeFile];

    return YES;
}

@end
