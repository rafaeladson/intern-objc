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
    self.dataManager = [[DataManager alloc] initWithDatabaseName:@"test"];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(documentOpened:) name:DOCUMENT_READY object:self.dataManager];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:10.0];

}

-(void) documentOpened:(NSNotification *)notification {
    Sample *sample = [NSEntityDescription insertNewObjectForEntityForName:@"Sample" inManagedObjectContext:self.dataManager.managedObjectContext];
    sample.name = @"Hello";
    [self.dataManager saveDocument];
    [self notify:kGHUnitWaitStatusSuccess forSelector:@selector(testOpenDocumentAndSaveEntity)];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(documentSaved:) name:NSManagedObjectContextDidSaveNotification object:self.dataManager.managedObjectContext];
    
}

-(void) documentSaved:(NSNotification *)notification {
    [self.dataManager closeDocument];
    [self.dataManager removeDocument];
}


@end
