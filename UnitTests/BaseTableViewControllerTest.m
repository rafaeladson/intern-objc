//
//  BaseTableViewControllerTest.m
//  intern-ios
//
//  Created by Rafael Adson Barbosa Barros on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GHUnitIOS/GHUnit.h>
#import "DataManagerBaseTest.h"
#import "DataManager.h"
#import "SampleTableViewController.h"
#import "Sample.h"

@interface BaseTableViewControllerTest : DataManagerBaseTest
-(SampleTableViewController *)controllerForAllSamples;

@end

@implementation BaseTableViewControllerTest



-(void) setUpClass {
    [self startWithDatabaseName:@"base_table_view_controller_test"];
    
}

-(void) testForTwoEntities {
    Sample *sampleA = [NSEntityDescription insertNewObjectForEntityForName:@"Sample" inManagedObjectContext:self.dataManager.managedObjectContext];
    sampleA.name = @"SampleA";
    
    Sample *sampleB = [NSEntityDescription insertNewObjectForEntityForName:@"Sample" inManagedObjectContext:self.dataManager.managedObjectContext];
    sampleB.name = @"SampleB";
    
    SampleTableViewController *controller = [self controllerForAllSamples];
    int numberOfRowsInTable = [controller tableView:controller.tableView numberOfRowsInSection:0];
    GHAssertEquals(2, numberOfRowsInTable, nil);
    UITableViewCell *firstCell = [controller tableView:controller.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    GHAssertEqualStrings(@"SampleA", firstCell.textLabel.text, nil);

    
    [self.dataManager.managedObjectContext deleteObject:sampleA];
    [self.dataManager.managedObjectContext deleteObject:sampleB];

}

-(void) testForOneEntity {
    Sample *sample = [NSEntityDescription insertNewObjectForEntityForName:@"Sample" inManagedObjectContext:self.dataManager.managedObjectContext];
    sample.name = @"Sample";
    
    SampleTableViewController *controller = [self controllerForAllSamples];
    int numberOfRowsInTable =  [controller tableView:controller.tableView numberOfRowsInSection:0];
    GHAssertEquals(1, numberOfRowsInTable, nil);
    UITableViewCell *firstCell = [controller tableView:controller.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    GHAssertEqualStrings(@"Sample", firstCell.textLabel.text, nil);
    
    [self.dataManager.managedObjectContext deleteObject:sample];
}

-(void) testForZeroEntities {
    
    SampleTableViewController *controller = [self controllerForAllSamples];
    GHAssertTrue(0 == [controller tableView:controller.tableView numberOfRowsInSection:0], @"%d = 0", [controller tableView:controller.tableView numberOfRowsInSection:0]);
    
}

-(SampleTableViewController *)controllerForAllSamples {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Sample"];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest 
                                                                                managedObjectContext:self.dataManager.managedObjectContext 
                                                                                   sectionNameKeyPath:nil cacheName:nil];
    SampleTableViewController *controller = [[SampleTableViewController alloc] init];
    UITableView *tableView = [[UITableView alloc] init];
    [controller setView:tableView];
    controller.fetchedResultsController = fetchedResultsController;
    return controller;
}


@end
