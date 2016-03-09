//
//  MBUserDefaults.h
//  Preferences
//
//  Created by Lacey Vu on 3/8/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * _Nonnull KMBUserDefaultsDidUpdate = @"com.laceyvu.KMBUserDefaultsDidUpdate";

@interface MBUserDefaults : NSObject

+ (nonnull instancetype)sharedDefaults;

- (void)setObject:(nonnull id)object key:(nonnull NSString*)key;
- (nonnull id)objectForKey: (nonnull NSString *)key;


@end
