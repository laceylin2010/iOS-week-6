//
//  Student+Additions.m
//  ClassRoster
//
//  Created by Lacey Vu on 3/9/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import "Student+Additions.h"
#import "NSString+Additions.h"

@import CloudKit;

@implementation Student (Additions)

-(BOOL)isValidStudent
{
    if (self.firstName.length > 0 && self.lastName.length > 0 && self.email.isValidEmailAddress) {
        return YES;
    }
    
    return NO;
}

+(void)studentsFromRecords:(NSArray *)records completion:(StudentCompletion)completion
{
    if (!records || records.count == 0) {
        completion(nil);
    }
    
    if (records.count > 0) {
        [[[NSOperationQueue alloc]init]addOperationWithBlock:^{
            NSMutableArray *students = [[NSMutableArray alloc]init];
            
            for (CKRecord *record in records) {
                NSString *firstName = record[@"firstName"];
                NSString *lastName = record[@"lastName"];
                NSString *email = record[@"email"];
                NSString *phone = record[@"phone"];
                
                Student *student = [[Student alloc]initWithFirstName:firstName
                                                            lastName:lastName
                                                               email:email
                                                               phone:phone];
                
                [students addObject:student];
            }
            
            [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                completion(students);
            }];
        }];
    }
}

@end
