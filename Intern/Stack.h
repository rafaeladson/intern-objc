//
//  Stack.h
//  Kotoba
//
//  Created by Rafael Adson Barbosa Barros on 2/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject {
    NSMutableArray *_wrapped;
}

@property(strong, atomic) NSMutableArray *_wrapped;

-(Stack *) init;
-(Stack *) initWithArray:(NSArray *)array;
-(id) pop;
-(void) push:(id)element;

@end
