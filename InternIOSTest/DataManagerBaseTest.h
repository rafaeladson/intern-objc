//
//  DataManagerTest.h
//  intern-ios
//
//  Created by Rafael Adson Barbosa Barros on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GHUnitIOS/GHUnit.h>

@class DataManager;


/**
 * Base class for tests that use the database.
 * In your setUpClassMethod, you should call startWithDatabaseName, specifying an unique database name.
 * Failure to pass an unique database name may result on test errors because of race conditions.
 * On the tearDownClass method, the database will be removed.
 * If you override tearDownClass method, don't forget to call super.
 */
@interface DataManagerBaseTest : GHAsyncTestCase 

/**
 * Please call this on your setUpClass method.
 */
-(void) startWithDatabaseName:(NSString *)databaseName;

@property (strong, nonatomic, readonly) DataManager *dataManager;

@end
