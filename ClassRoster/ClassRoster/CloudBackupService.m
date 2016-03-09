//
//  CloudBackupService.m
//  ClassRoster
//
//  Created by Lacey Vu on 3/9/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import "CloudBackupService.h"

static NSString *const StudentRecordType = @"Student";

@interface CloudBackupService ()

@property (strong, nonatomic) CKContainer *container;
@property (strong, nonatomic) CKDatabase *database;

@end



@implementation CloudBackupService



+(instancetype)sharedService
{
    static CloudBackupService *sharedService = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedService = [[[self class]alloc]init];
    });
    
     return sharedService;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        _container = [CKContainer defaultContainer];
        _database = [_container privateCloudDatabase];
    }
    
    return self;
}

-(void)enqueueOperation:(CloudBackupServiceCompletion)completion
{
    [self enqueueOperation:CloudOperationRetrieve student:nil completion:completion];
}

-(void)enqueueOperation: (CloudOperation)operation student:(Student *)student completion: (CloudBackupServiceCompletion)completion
{
    if (operation == CloudOperationSave) {
        [self save:student completion:completion];
    }
    
    if (operation == CloudOperationRetrieve) {
        [self retrieve: completion];
    }
    
    if (operation == CloudOperationDelete) {
        [self delete:student completion: completion];
    }
}


#pragma mark - Helper Methods

-(void)retrieve: (CloudBackupServiceCompletion)completion
{
    //getting all student records from cloudkit
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"TRUEPREDICATE"];
    CKQuery *query = [[CKQuery alloc]initWithRecordType:StudentRecordType predicate:predicate];
    
    [self.database performQuery:query inZoneWithID:nil completionHandler:^(NSArray<CKRecord *> * _Nullable results, NSError * _Nullable error) {
        
        [Student studentsFromRecords:results completion:^(NSArray *students) {
            completion(YES, students);
        }];
        
    }];
}

-(void)save:(Student *)student completion:(CloudBackupServiceCompletion)completion
{
 
    //creates CKRecord and uses student variables and sets the properties to the student record(CKRecord) and tells it to save to cloudkit.
    
    CKRecord *studentRecord = [[CKRecord alloc]initWithRecordType:StudentRecordType];
    studentRecord[@"firstName"] = student.firstName;
    studentRecord[@"lastName"] = student.lastName;
    studentRecord[@"email"] = student.email;
    studentRecord[@"phone"] = student.phone;
    
    [self.database saveRecord:studentRecord completionHandler:^(CKRecord * _Nullable record, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", [error localizedDescription]);
        }
        
        else if(record) {
            [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                completion(YES, @[student]);
            }];
        }
    }];
}

-(void)delete:(Student *)student completion:(CloudBackupServiceCompletion)completion
{
    //creating predicate and searching for student with email address. create and execute query to cloudkit and will give us an array of those records. then when we get results we will delete from cloudkit.
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"email == %@", student.email];
    CKQuery *query = [[CKQuery alloc]initWithRecordType:StudentRecordType predicate:predicate];
    [self.database performQuery:query inZoneWithID:nil completionHandler:^(NSArray<CKRecord *> * _Nullable results, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", [error localizedDescription]);
        }
        else if (results) {
            for (CKRecord *record in results) {
                [self.database deleteRecordWithID:record.recordID completionHandler:^(CKRecordID * _Nullable recordID, NSError * _Nullable error) {
                    if (error) {
                        NSLog(@"%@", [error localizedDescription]);
                    }
                    else {
                        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                            completion(YES, @[student]);
                        }];
                    }
                }];
            }
        }
        
    }];
    
    
}


@end
