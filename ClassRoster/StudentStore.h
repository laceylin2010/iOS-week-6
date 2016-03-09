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

@interface StudentStore : NSObject

+ (instancetype)sharedStore;

-(NSInteger)count;
-(NSArray *)allStudents;
-(Student *)studentsForIndexPath:(NSIndexPath *)indexPath;
-(void)add:(Student *)student;
-(void)remove: (Student *)student;
-(void)removeStudentAtIndexPath: (NSIndexPath *)indexPath;
-(void)save;





@end
