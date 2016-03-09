//
//  Student+Additions.h
//  ClassRoster
//
//  Created by Lacey Vu on 3/9/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import "Student.h"

typedef void(^StudentCompletion)(NSArray *stidents);

@interface Student (Additions)

-(BOOL)isValidStudent;
+(void)studentsFromRecords:(NSArray *)records completion:(StudentCompletion)completion;

@end
