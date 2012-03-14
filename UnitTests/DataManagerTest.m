//
//  DataManagerTest.m
//  intern-ios
//
//  Created by Rafael Adson Barbosa Barros on 2/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GHUnitIOS/GHUnit.h>
#import "DataManager.h"
#import "Sample.h"
#import "DataManagerDelegate.h"

@interface DataManagerTest : GHAsyncTestCase <DataManagerDelegate>

@property(strong, nonatomic) DataManager *dataManager;

@end

@implementation DataManagerTest

@synthesize dataManager = _dataManager;

-(void) testOpenDocumentAndSaveEntity {
    [self prepare];
    self.dataManager = [[DataManager alloc] initWithDatabaseName:@"test_datamanger" andDelegate:self];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:10.0];

}

-(void) documentDidLoad {
    Sample *sample = [NSEntityDescription insertNewObjectForEntityForName:@"Sample" inManagedObjectContext:self.dataManager.managedObjectContext];
    sample.name = @"Hello";
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Sample"];
    NSError *error = nil;
    NSArray *samples = [self.dataManager.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if ( error ) {
        GHFail([error localizedFailureReason]);
    }
    GHAssertTrue([samples count] == 1, @"%d should be greater or equal than 1", [samples count]);
    Sample *sampleFromDatabase = [samples objectAtIndex:0];
    GHAssertEqualStrings(@"Hello", sampleFromDatabase.name, nil);
    
    
    [self notify:kGHUnitWaitStatusSuccess forSelector:@selector(testOpenDocumentAndSaveEntity)];
    
}


-(void) tearDownClass {
    [self.dataManager closeDocument];
    [self.dataManager removeDocument];
}




@end
