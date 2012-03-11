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


-(NSArray *)getAllInstancesOfEntity:(NSString *)entityName;

/**
 * This should ideally be called on the teardown method to delete all entities for a given entity name.
 * You don't need to do it if you have only one method in your test, or if the fact that there are entities
 * on the database won't affect your tests.
 * This was created because my normal approach to this problem was to delete manually in the end of every test.
 * However, if the test failed, the entities in the database wouldn't be deleted, creating a problem
 * for other tests.
 * Note: this will not handle primary key violations, nor it will cascade.
 */
-(void) deleteInstancesWithEntityName:(NSString *)entityName;

@property (strong, nonatomic, readonly) DataManager *dataManager;

@end
