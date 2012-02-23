//
//  CircularItemCursor.h
//  intern-ios
//
//  Created by Rafael Adson Barbosa Barros on 2/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RandomIterator;

@interface CircularItemCursor : NSObject {
}

-(CircularItemCursor *) initWithArray:(NSArray *)array;
-(void) goToNext;


@property (strong, nonatomic, readonly) id currentItem;


@end
