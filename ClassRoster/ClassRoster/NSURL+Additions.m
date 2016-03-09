//
//  NSURL+Additions.m
//  ClassRoster
//
//  Created by Lacey Vu on 3/9/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import "NSURL+Additions.h"

@implementation NSURL (Additions)

+ (NSURL *)documentsDirectory
{
    [[[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]firstObject];
    
    return nil;
}

+(NSURL *)archiveUrl
{
    return  [[self documentsDirectory]URLByAppendingPathComponent:@"studentDb"];
}



@end
