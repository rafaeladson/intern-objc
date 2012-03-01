//
//  BaseTableViewController.h
//  intern-ios
//
//  Created by Rafael Adson Barbosa Barros on 2/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@class DataManager;
@class AlertHelper;

/**
 * This is just a table view controller with some automated methods to simplify the implementation of 
 * instances.
 * So far, this has not support for multi-sections table. If you want to use it in a multisection table,
 * you should implement the methods tableView:titleForHeaderInSection, sectionIndexTitlesForTableView:
 * and tableView:sectionForSectionIndexTitle: either in your class or preferably here.
 */
@interface BaseTableViewController : UITableViewController<NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, readwrite) AlertHelper *alertHelper;

@end
