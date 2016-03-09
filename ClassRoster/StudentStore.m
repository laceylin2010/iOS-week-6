//
//  StudentStore.m
//  ClassRoster
//
//  Created by Lacey Vu on 3/9/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import "StudentStore.h"
#import "NSURL+Additions.h"
#import "CloudBackupService.h"
#import "Student+Additions.h"

@interface StudentStore ()

@property (strong, nonatomic) NSMutableArray *students;

@end


@implementation StudentStore

+(instancetype)sharedStore
{
    static StudentStore *sharedStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        sharedStore = [[[self class]alloc]init];
        
        
    });
    
    return sharedStore;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        
        //try initializing students array from the archive
        _students = [NSKeyedUnarchiver unarchiveObjectWithData:[NSData dataWithContentsOfURL:[NSURL archiveUrl]]];
        
        
        //if initialization fails, create new array
        if (!_students){
            _students = [[NSMutableArray alloc]init];
        }
    }
    
    return self;
}

#pragma mark - Instance Methods

-(void)addStudentsFromCloudKit:(NSArray *)students
{
    if (self.students.count == 0) {
        self.students = [[NSMutableArray alloc]initWithArray:students];
    } else {
        
        for (Student *student in students) {
            NSString *email = student.email;
            BOOL found = NO;
            
            for (Student *localStudent in self.students) {
                NSString *localEmail = localStudent.email;
                
                if ([email isEqualToString:localEmail]) {
                    found = YES; break;
                }
            }
            
            if (found == NO) {
                [self.students addObject:student];
            }
        }
    }
    
}

-(NSInteger)count
{
    return [self.students count];
}

-(Student *)studentsForIndexPath:(NSIndexPath *)indexPath
{
    return [self.students objectAtIndex:indexPath.row];
    
    
}


-(NSArray *)allStudents
{
    return self.students;
}

-(void)add:(Student *)student completion:(StudentStoreCompletion)completion
{
    if (![self.students containsObject:student]) {
        [[CloudBackupService sharedService]enqueueOperation:CloudOperationSave student:student completion:^(BOOL success, NSArray *students) {
            [self.students addObject:students.firstObject];
            [self save];
            
            completion();
         
         }];
    }

}

-(void)remove: (Student *)student completion:(StudentStoreCompletion)completion
{
    
    if ([self.students containsObject:student]) {
        [[CloudBackupService sharedService]enqueueOperation:CloudOperationDelete student:student completion:^(BOOL success, NSArray *students) {
            [self.students removeObject:student];
            [self save];
            
            completion();
        }];
    }

    
}
-(void)removeStudentAtIndexPath: (NSIndexPath *)indexPath completion:(StudentStoreCompletion)completion
{
    [self remove:[self studentsForIndexPath:indexPath]completion:completion];

    
}
-(void)save
{
    [NSKeyedArchiver archiveRootObject:self.students toFile:[[NSURL archiveUrl]path]];
}




@end
