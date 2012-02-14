//
//  PreConditions.m
//  Intern
//
//  Created by Rafael Adson Barbosa Barros on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PreConditions.h"

@implementation PreConditions

+(void) checkNotNil:(id)argument {
    [PreConditions checkNotNil:argument withMessage:@"Argument should not be nil"];
}

+(void) checkNotNil:(id)argument withMessage:(NSString *)message {
    if ( argument == nil ) {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:message userInfo:nil];
    }
}

+(void) checkDoesNotContainNil:(NSArray *)array {
    [PreConditions checkDoesNotContainNil:array withMessage:@"Array should not contain nil"];
}

+(void) checkDoesNotContainNil:(NSArray *)array withMessage:(NSString *)message {
    [PreConditions checkNotNil:array];
    for ( int i = 0; i < [array count]; i++ ) {
        if ( [array objectAtIndex:i] == nil ) {
            @throw [NSException exceptionWithName:NSInvalidArgumentException reason:message userInfo:nil];
        }
    }
}

@end
