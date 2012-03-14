//
//  DataManagerTest.m
//  intern-ios
//
//  Created by Rafael Adson Barbosa Barros on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DataManagerBaseTest.h"
#import "DataManager.h"
#import <CoreData/CoreData.h>


@interface DataManagerBaseTest() 
@property (strong, nonatomic, readwrite) DataManager *dataManager;
@end


@implementation DataManagerBaseTest

@synthesize dataManager = _dataManager;

-(void) startWithDatabaseName:(NSString *)databaseName {
    [self prepare];
    self.dataManager = [[DataManager alloc] initWithDatabaseName:databaseName andDelegate:self];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:10.0];

}

-(void) documentDidLoad {
        [self notify:kGHUnitWaitStatusSuccess forSelector:nil];
}

-(NSArray *)getAllInstancesOfEntity:(NSString *)entityName {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:entityName];
    NSError *error = nil;
    
    NSArray *allInstances = [self.dataManager.managedObjectContext executeFetchRequest:request error:&error];
    GHAssertNil(error, nil);
    return allInstances;
}

-(void) deleteInstancesWithEntityName:(NSString *)entityName {
    NSArray *allInstancesOnDatabase = [self getAllInstancesOfEntity:entityName];
    for (int i = 0; i < [allInstancesOnDatabase count]; i++) {
        [self.dataManager.managedObjectContext deleteObject:[allInstancesOnDatabase objectAtIndex:i]];
    }
}

-(void) tearDownClass {
    [self.dataManager closeDocument];
    [self.dataManager removeDocument];
}

@end
