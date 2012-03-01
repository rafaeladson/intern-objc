//
//  BaseTableViewController.m
//  intern-ios
//
//  Created by Rafael Adson Barbosa Barros on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BaseTableViewController.h"
#import "DataManager.h"
#import "AlertHelper.h"

@implementation BaseTableViewController

@synthesize fetchedResultsController = _fetchedResultsController, alertHelper = _alertHelper;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

-(void) setFetchedResultsController:(NSFetchedResultsController *)fetchedResultsController {
    _fetchedResultsController = fetchedResultsController;
    fetchedResultsController.delegate = self;
    NSError *error = nil;
    [fetchedResultsController performFetch:&error];
    if ( error ) {
        NSLog(@"Could not fetch data from database");
        [self.alertHelper showAlertDialogWithMessage:NSLocalizedString(@"Could not fetch data from database", nil)]; 
    }
}

-(void) controllerDidChangeContent:(NSFetchedResultsController *)controller {
    
}

-(void) dealloc {
    self.fetchedResultsController.delegate = nil;
    self.fetchedResultsController = nil;
}

@end
