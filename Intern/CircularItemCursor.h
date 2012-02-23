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
    NSArray *_items;
    RandomIterator *_iterator;
    id _currentItem;
}

-(CircularItemCursor *) initWithArray:(NSArray *)array;
-(void) goToNext;
-(id) getCurrent; 


@property (strong, nonatomic) NSArray *_items;
@property (strong, nonatomic) RandomIterator *_iterator;
@property (strong, nonatomic) id _currentItem;

@end
