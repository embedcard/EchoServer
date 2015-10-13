//
//  GDRemoteLogger.m
//
//  Created by Gary Davies on 28/11/13.
//

#import "GDRemoteLogger.h"

@implementation GDRemoteLogger {
	dispatch_queue_t queue;
}

-(id)init {
    self = [super init];
    if(self != nil)
    {
        _serverName = @"127.0.0.1";
        _appName = @"GDRemoteLogger";
		
		queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    }
    return self;
}

#pragma mark - Singleton

+ (GDRemoteLogger *)sharedInstance {
	static GDRemoteLogger *_remoteLogger = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _remoteLogger = [[self alloc] init];
    });
    
    return _remoteLogger;
}

+ (NSString *)urlencode:(NSString *)str {
    NSMutableString *output = [NSMutableString string];
    const unsigned char *source = (const unsigned char *)[str UTF8String];
    NSUInteger sourceLen = strlen((const char *)source);
    for (int i = 0; i < sourceLen; ++i) {
        const unsigned char thisChar = source[i];
        if (thisChar == ' '){
            [output appendString:@"+"];
        } else if (thisChar == '.' || thisChar == '-' || thisChar == '_' || thisChar == '~' ||
                   (thisChar >= 'a' && thisChar <= 'z') ||
                   (thisChar >= 'A' && thisChar <= 'Z') ||
                   (thisChar >= '0' && thisChar <= '9')) {
            [output appendFormat:@"%c", thisChar];
        } else {
            [output appendFormat:@"%%%02X", thisChar];
        }
    }
    return output;
}

- (void)log:(NSString *)message {
#if TARGET_IPHONE_SIMULATOR || DEBUG
    if(message == nil) {
        message = @"nil";
    }
    NSString *urlString = [NSString stringWithFormat:@"http://%@/appLog.php?appName=%@&message=%@", _serverName, _appName, [GDRemoteLogger urlencode:message ]];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:url];
    
	dispatch_sync(queue, ^{
		[NSURLConnection sendSynchronousRequest:theRequest returningResponse:nil error:nil];
	});
#endif
}

@end
