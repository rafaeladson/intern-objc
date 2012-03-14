//
//  DataManager.h
//  intern-ios
//
//  Created by Rafael Adson Barbosa Barros on 2/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


/**
 * Use this to manage the core data database for you. 
 * It abstracts common operations for the document lifecycle so you don't have to deal with it.
 * To see an example, see DataManagerTest on UnitTests target.
 */
@interface DataManager : NSObject

/**
 * Creates and open a database. If the database already exists, it will only be opened.
 * databaseName is the desired name for the database. For example, if you define databaseName
 * to be "kotoba", a file named "kotoba.db" will be created on the user's document directory.
 * Be sure to not use your database after only defining this method. You should listen
 * for a notification with the name returned by documentReadyNotificationName on notificationCenter 
 * before doing anything with this document.
 * If in doubt, go see hte DataMaangerTest class.
 */
-(DataManager *) initWithDatabaseName:(NSString *)databaseName andDelegate:(id)delegate;
/**
 * Saves the document. 
 * Iphone normally saves the document when you close the application, so it's not entirely required,
 * although it is recommended, to save the document after you do a batch of operations that changes it,
 * but only if you want to avoid the user doing extra work.
 */
-(void) saveDocument;
/**
 * THIS IS A DANGEROUS OPERATION!!!
 * This will remove the database document, and it will be permanently lost.
 * You probably don't want to do this in your app's code. I included it here because in tests it may be useful
 * to put this method in tearDown so that every test begin with a clean database.
 */
-(void) removeDocument;

/**
 * Closes the document. You'll want to do that when you don't want to use the document anymore.
 */
-(void) closeDocument;


@property (strong, nonatomic, readonly) NSManagedObjectContext *managedObjectContext;


@end
