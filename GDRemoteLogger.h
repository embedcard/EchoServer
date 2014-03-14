//
//  GDRemoteLogger.h
//
//  Created by Gary Davies on 28/11/13.
//

#import <Foundation/Foundation.h>

@interface GDRemoteLogger : NSObject

@property (nonatomic, strong) NSString *serverName;
@property (nonatomic, strong) NSString *appName;

+ (GDRemoteLogger *)sharedInstance;
- (void)log:(NSString *)message;

@end
