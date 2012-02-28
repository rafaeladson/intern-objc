//
//  DataManagerTest.m
//  intern-ios
//
//  Created by Rafael Adson Barbosa Barros on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DataManagerBaseTest.h"
#import "DataManager.h"


@interface DataManagerBaseTest() 
@property (strong, nonatomic, readwrite) DataManager *dataManager;
-(void) documentOpened:(NSNotification *)notification;
@end


@implementation DataManagerBaseTest

@synthesize dataManager = _dataManager;

-(void) startWithDatabaseName:(NSString *)databaseName {
    [self prepare];
    self.dataManager = [[DataManager alloc] initWithDatabaseName:databaseName];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(documentOpened:) name:DOCUMENT_READY object:self.dataManager];
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:10.0];

}

-(void) documentOpened:(NSNotification *)notification {
        [self notify:kGHUnitWaitStatusSuccess forSelector:nil];
}

-(void) tearDownClass {
    [self.dataManager closeDocument];
    [self.dataManager removeDocument];
}

@end
