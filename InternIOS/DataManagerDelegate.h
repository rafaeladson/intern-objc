//
//  DataManagerDelegate.h
//  intern-ios
//
//  Created by Rafael Adson Barbosa Barros on 3/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * You should implement this delegate when you want to listen from lyfecicle events from the DataManager.
 * The most probable reason for implementing this is to be told when the document finished loading.
 */
@protocol DataManagerDelegate <NSObject>

@optional 

/**
 * This will be called when the document has been fully loaded and is ready to use.
 * You should'nt perform any operations in the database before this happens.
 */
-(void) documentDidLoad;



@end
