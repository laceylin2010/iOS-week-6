//
//  StudentStore.h
//  ClassRoster
//
//  Created by Lacey Vu on 3/9/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
@class Student; //tells compiler this class exists vs importing Student

typedef void (^StudentStoreCompletion)();

@interface StudentStore : NSObject

+ (instancetype)sharedStore;

-(void)addStudentsFromCloudKit:(NSArray *)students;
-(NSInteger)count;
-(NSArray *)allStudents;
-(Student *)studentsForIndexPath:(NSIndexPath *)indexPath;
-(void)add:(Student *)student completion:(StudentStoreCompletion)completion;
-(void)remove: (Student *)student completion:(StudentStoreCompletion)completion;
-(void)removeStudentAtIndexPath: (NSIndexPath *)indexPath completion:(StudentStoreCompletion)completion;
-(void)save;





@end
