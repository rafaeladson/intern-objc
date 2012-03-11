//
//  DataManagerBaseTestTest.m
//  intern-ios
//
//  Created by Rafael Adson Barbosa Barros on 3/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sample.h"
#import "DataManagerBaseTest.h"
#import "DataManager.h"

@interface DataManagerBaseTestTest : DataManagerBaseTest

-(int) getNumberOfSamplesInDatabase;

@end


@implementation DataManagerBaseTestTest

-(void) setUpClass {
    [self startWithDatabaseName:@"data_manager_base_test_test"];
}

-(void) testGetAllInstancesOfEntity {
    Sample *sample = [NSEntityDescription insertNewObjectForEntityForName:@"Sample" inManagedObjectContext:self.dataManager.managedObjectContext];
    sample.name = @"foo";
    
    NSArray *allSamples = [self getAllInstancesOfEntity:@"Sample"];
    int numberOfSamples = [allSamples count];
    GHAssertEquals(1, numberOfSamples, nil);
    
    [self.dataManager.managedObjectContext deleteObject:sample];
}

-(void) testGetAllInstancesOfEntityWithEmptyDatabase {
    NSArray *allSamples = [self getAllInstancesOfEntity:@"Sample"];
    int numberOfSamples = [allSamples count];
    GHAssertEquals(0, numberOfSamples, nil);
}

-(void) testDeleteInstancesWithEntityName {
    Sample *sample = [NSEntityDescription insertNewObjectForEntityForName:@"Sample" inManagedObjectContext:self.dataManager.managedObjectContext];
    sample.name = @"foo";
    
    Sample *anotherSample = [NSEntityDescription insertNewObjectForEntityForName:@"Sample" inManagedObjectContext:self.dataManager.managedObjectContext];
    anotherSample.name = @"bar";
    
    [self deleteInstancesWithEntityName:@"Sample"];
    
    GHAssertEquals(0, [self getNumberOfSamplesInDatabase], nil);
}

-(void) testDeleteObjectsWithEntityName_zeroObjectsOnDatabase {
    [self deleteInstancesWithEntityName:@"Sample"];
    GHAssertEquals(0, [self getNumberOfSamplesInDatabase], nil);
}

-(int) getNumberOfSamplesInDatabase {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Sample"];
    NSError *error = nil;
    NSArray *fetchedSamples = [self.dataManager.managedObjectContext executeFetchRequest:request error:&error];
    return [fetchedSamples count];
}


@end
