//
//  DataManager.m
//  intern-ios
//
//  Created by Rafael Adson Barbosa Barros on 2/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DataManager.h"
#import "AlertHelper.h"
#import <UIKit/UIKit.h>
#import "DataManagerDelegate.h"



@interface DataManager() 

@property (strong, nonatomic, readwrite) UIManagedDocument *document;
@property (strong, nonatomic) AlertHelper *alertHelper;
@property (strong, nonatomic) id delegate;

-(void) openDocument;
-(void) notifyDocumentReady;
-(void) documentLoadFailed;

@end

@implementation DataManager

@synthesize document = _document, alertHelper = _alertHelper, delegate = _delegate;


-(DataManager *) initWithDatabaseName:(NSString *)databaseName andDelegate:(id)delegate {
    self = [super init];
    if ( self ) {
        self.delegate = delegate;
        _alertHelper = [[AlertHelper alloc] init];
        NSString *dbPath = [databaseName stringByAppendingString:@".db"];
        NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        NSURL *dbUrl = [url URLByAppendingPathComponent:dbPath];
        self.document = [[UIManagedDocument alloc] initWithFileURL:dbUrl];
        [self openDocument];
    }
    
    return self;
}

-(NSManagedObjectContext *) managedObjectContext {
    return self.document.managedObjectContext;
}

-(void) openDocument {
    if ( ![[NSFileManager defaultManager] fileExistsAtPath:[self.document.fileURL path]] ) {
        [self.document saveToURL:self.document.fileURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success) {
            if ( success ) {
                [self notifyDocumentReady];
            }
            else {
                [self documentLoadFailed];
            }
        }];
    } else if ( self.document.documentState == UIDocumentStateClosed ) {
        [self.document openWithCompletionHandler:^(BOOL success) {
            if( success ) {
                [self notifyDocumentReady];
            } else {
                [self documentLoadFailed];
            }
            
        }];
    } else if ( self.document.documentState == UIDocumentStateNormal ) {
        [self notifyDocumentReady];
    }
}

-(void) saveDocument {
    [self.document saveToURL:self.document.fileURL forSaveOperation:UIDocumentSaveForOverwriting completionHandler:^(BOOL success) {
        if(!success) {
            [self.alertHelper showAlertDialogWithMessage:NSLocalizedStringFromTable(@"Internal Error: Could not save document", @"Intern", nil)];
        }
    }];
}


-(void) closeDocument {
    [self.document closeWithCompletionHandler:^(BOOL success) {
        if ( !success ) {
            NSLog(@"Could not close document, failing without bringing up message...");
        }
    }];
}


-(void) removeDocument {
    NSError *error = nil;
    if( [[NSFileManager defaultManager] fileExistsAtPath:[self.document.fileURL path]] ) {
        [[NSFileManager defaultManager] removeItemAtURL:self.document.fileURL error:&error];
        if ( error ) {
            [self.alertHelper showAlertDialogWithMessage:NSLocalizedStringFromTable(@"Internal error: failed to remove database", @"Intern", nil)];
        }
    }
}
                
-(void) notifyDocumentReady {
    if ( [self.delegate respondsToSelector:@selector(documentDidLoad)] ) {
        [self.delegate documentDidLoad];
    }
                    
}


-(void) documentLoadFailed {
    NSString *errorMessage = NSLocalizedStringFromTable(@"Internal error: Could not open the database", @"Intern", nil);
    [self.alertHelper showAlertDialogWithMessage:errorMessage];
}




@end
