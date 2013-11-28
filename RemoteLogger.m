//
//  RemoteLogger.m
//  emPOS
//
//  Created by Gary Davies on 28/11/13.
//  Copyright (c) 2013 Embed International Pty Ltd. All rights reserved.
//

#import "RemoteLogger.h"

static NSString *SERVER_NAME = @"192.168.0.180";
static NSString *APP_NAME = @"emPOS";

@implementation RemoteLogger

+(NSString *)urlencode:(NSString *)str {
    NSMutableString *output = [NSMutableString string];
    const unsigned char *source = (const unsigned char *)[str UTF8String];
    int sourceLen = strlen((const char *)source);
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

+(void)log:(NSString *)server message:(NSString *)message {
    NSString *urlString = [NSString stringWithFormat:@"http://%@/appLog.php?appName=%@&message=%@", server, APP_NAME, [RemoteLogger urlencode:message ]];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:url];
    
    NSURLResponse* response = nil;
    [NSURLConnection sendSynchronousRequest:theRequest returningResponse:&response error:nil];
}

@end
