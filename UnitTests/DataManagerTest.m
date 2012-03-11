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

@interface DataManagerTest : GHAsyncTestCase

@property(strong, nonatomic) DataManager *dataManager;

@end

@implementation DataManagerTest

@synthesize dataManager = _dataManager;

-(void) testOpenDocumentAndSaveEntity {
    [self prepare];
    self.dataManager = [[DataManager alloc] initWithDatabaseName:@"test_datamanger"];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(documentOpened:) name:self.dataManager.documentReadyNotificationName object:self.dataManager];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:10.0];

}

-(void) documentOpened:(NSNotification *)notification {
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
