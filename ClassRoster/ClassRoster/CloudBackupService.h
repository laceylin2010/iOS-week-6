//
//  CloudBackupService.h
//  ClassRoster
//
//  Created by Lacey Vu on 3/9/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

@import UIKit;
@import CloudKit;
#import "Student+Additions.h"

@class Student;

typedef enum: NSUInteger
{
    CloudOperationSave = 0,
    CloudOperationRetrieve,
    CloudOperationDelete,
    
} CloudOperation;

typedef void(^CloudBackupServiceCompletion)(BOOL success, NSArray *students);

@interface CloudBackupService : NSObject

+(instancetype)sharedService;

-(void)enqueueOperation:(CloudBackupServiceCompletion)completion;

-(void)enqueueOperation: (CloudOperation)operation
                student:(Student *)student
             completion: (CloudBackupServiceCompletion)completion;

@end
