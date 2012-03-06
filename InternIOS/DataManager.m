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


NSString * const DOCUMENT_READY = @"DOCUMENT_READY";

@interface DataManager() 

@property (strong, nonatomic, readwrite) UIManagedDocument *document;
@property (strong, nonatomic) AlertHelper *alertHelper;
-(void) openDocument;
-(void) notifyDocumentReady;
-(void) documentLoadFailed;

@end

@implementation DataManager

@synthesize document = _document, alertHelper = _alertHelper;


-(DataManager *) initWithDatabaseName:(NSString *)databaseName {
    self = [super init];
    if ( self ) {
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
    [[NSNotificationCenter defaultCenter] postNotificationName:DOCUMENT_READY object:self];
                    
}

-(void) documentLoadFailed {
    NSString *errorMessage = NSLocalizedStringFromTable(@"Internal error: Could not open the database", @"Intern", nil);
    [self.alertHelper showAlertDialogWithMessage:errorMessage];
}




@end
