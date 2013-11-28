//
//  RemoteLogger.h
//  emPOS
//
//  Created by Gary Davies on 28/11/13.
//  Copyright (c) 2013 Embed International Pty Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RemoteLogger : NSObject

+(void)log:(NSString *)server message:(NSString *)message;

@end
