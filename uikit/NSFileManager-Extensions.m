#import "NSFileManager-Extensions.h"

NSString *NSDocumentsFolder()
{
	return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}

NSString *NSLibraryFolder()
{
	return [NSHomeDirectory() stringByAppendingPathComponent:@"Library"];
}

NSString *NSTmpFolder()
{
	return [NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
}

NSString *NSBundleFolder()
{
	return [[NSBundle mainBundle] bundlePath];
}

NSString *NSDCIMFolder()
{
	return @"/var/mobile/Media/DCIM";
}


@implementation NSFileManager (Extensions)

+ (NSString *)pathForItemNamed:(NSString *)name inFolder:(NSString *)path
{
	NSString *file;
	NSDirectoryEnumerator *dirEnum = [[NSFileManager defaultManager] enumeratorAtPath:path];
	while (file = [dirEnum nextObject])
		if ([[file lastPathComponent] isEqualToString:fname])
			return [path stringByAppendingPathComponent:file];
	return nil;
}

+ (NSString *)pathForDocumentNamed:(NSString *)name
{
	return [NSFileManager pathForItemNamed:fname inFolder:NSDocumentsFolder()];
}

+ (NSString *)pathForBundleDocumentNamed:(NSString *)name
{
	return [NSFileManager pathForItemNamed:fname inFolder:NSBundleFolder()];
}

+ (NSArray *)filesInFolder:(NSString *)path
{
	NSString *file;
	NSMutableArray *results = [NSMutableArray array];
	NSDirectoryEnumerator *dirEnum = [[NSFileManager defaultManager] enumeratorAtPath:path];
	while (file = [dirEnum nextObject]) {
		BOOL isDir;
		[[NSFileManager defaultManager] fileExistsAtPath:[path stringByAppendingPathComponent:file] isDirectory: &isDir];
		if (!isDir) [results addObject:file];
	}
	return results;
}

// Case insensitive compare, with deep enumeration
+ (NSArray *)pathsForItemsMatchingExtension:(NSString *)ext inFolder:(NSString *)path
{
	NSString *file;
	NSMutableArray *results = [NSMutableArray array];
	NSDirectoryEnumerator *dirEnum = [[NSFileManager defaultManager] enumeratorAtPath:path];
	while (file = [dirEnum nextObject])
		if ([[file pathExtension] caseInsensitiveCompare:ext] == NSOrderedSame)
			[results addObject:[path stringByAppendingPathComponent:file]];
	return results;
}

+ (NSArray *)pathsForDocumentsMatchingExtension:(NSString *)ext
{
	return [NSFileManager pathsForItemsMatchingExtension:ext inFolder:NSDocumentsFolder()];
}

// Case insensitive compare
+ (NSArray *)pathsForBundleDocumentsMatchingExtension:(NSString *)ext
{
	return [NSFileManager pathsForItemsMatchingExtension:ext inFolder:NSBundleFolder()];
}

@end
