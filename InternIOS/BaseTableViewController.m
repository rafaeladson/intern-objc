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

@synthesize fetchedResultsController = _fetchedResultsController, alertHelper = _alertHelper, dataManager = _dataManager;

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
    [self.tableView reloadData];
}

-(void) setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:YES];
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ( editingStyle == UITableViewCellEditingStyleDelete ) {
        NSManagedObject *deletedItem = [self.fetchedResultsController objectAtIndexPath:indexPath];
        [self.dataManager.managedObjectContext deleteObject:deletedItem];
    }
}



-(void) dealloc {
    self.fetchedResultsController.delegate = nil;
    self.fetchedResultsController = nil;
}

@end
