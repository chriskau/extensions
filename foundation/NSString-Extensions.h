@interface NSString (Utilities)

- (BOOL)contains:(NSString *)aString;

- (BOOL)appendToFile:(NSString *)path usingEncoding:(NSStringEncoding)encoding;

- (NSString *)stringByReplacingPercentEscapes;

@end
