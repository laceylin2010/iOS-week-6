//
//  StudentStore.m
//  ClassRoster
//
//  Created by Lacey Vu on 3/9/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import "StudentStore.h"
#import "NSURL+Additions.h"

@interface StudentStore ()

@property (strong, nonatomic) NSMutableArray *students;

@end


@implementation StudentStore

-(instancetype)sharedStore
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

-(NSArray *)allStudents
{
    return self.students;
}

-(void)add:(Student *)student
{
    [self.students addObject:student];
    [self save];
}
-(void)remove: (Student *)student
{
    [self.students removeObject:student];
    [self save];
    
}
-(void)removeStudentAtIndexPath: (NSIndexPath *)indexPath
{
    if (self.students.count >= indexPath.row){
        [self.students removeObjectAtIndex:indexPath.row];
        [self save];
    }
    
}
-(void)save
{
    [NSKeyedArchiver archiveRootObject:self.students toFile:[[NSURL archiveUrl]path]];
}




@end
