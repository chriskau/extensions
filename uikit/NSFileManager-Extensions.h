#import <UIKit/UIKit.h>

// Path Utilities
NSString *NSDocumentsFolder();
NSString *NSLibraryFolder();
NSString *NSTmpFolder();
NSString *NSBundleFolder();

@interface NSFileManager (Extensions)
+ (NSString *)pathForItemNamed:(NSString *)name inFolder:(NSString *)path;
+ (NSString *)pathForDocumentNamed:(NSString *)name;
+ (NSString *)pathForBundleDocumentNamed:(NSString *)name;

+ (NSArray *)pathsForItemsMatchingExtension:(NSString *)ext inFolder:(NSString *) path;
+ (NSArray *)pathsForDocumentsMatchingExtension:(NSString *)ext;
+ (NSArray *)pathsForBundleDocumentsMatchingExtension:(NSString *)ext;

+ (NSArray *)filesInFolder:(NSString *)path;

+ (UIImage *)imageNamed:(NSString *)name;
+ (UIImage *)imageFromURLString:(NSString *)urlstring;
@end
