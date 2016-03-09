//
//  MBUserDefaults.m
//  Preferences
//
//  Created by Lacey Vu on 3/8/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//


#import "MBUserDefaults.h"

@interface MBUserDefaults() //all properties are going to be private to this class

@property(strong, nonatomic) NSMutableDictionary *preferences;

@end

@implementation MBUserDefaults

+(nonnull instancetype)sharedDefaults
{
    static MBUserDefaults *shared = nil;
    
    static dispatch_once_t onceToken; //establishing singleton
dispatch_once(&onceToken, ^{
    shared = [[[self class]alloc]init];
});
    
    
    return shared;
    
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _preferences = [self setupPreferences];
    }
    return self;
}


- (void)setObject:(id)object key:(NSString *)key
{
    [self.preferences setObject: object forKey:key];
    [self sync];
}

- (nonnull id)objectForKey: (NSString *)key
{
    return [self.preferences objectForKey:key];
}

- (void)reset
{
    [[NSFileManager defaultManager]removeItemAtURL:[self preferencesURL] error:nil];
    [self sync];
}


#pragma mark - Helper Functions

- (void)sync
{
    NSError *error;
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:self.preferences options:NSJSONWritingPrettyPrinted error:&error];
    
    if (!error && jsonData) {
        if ([jsonData writeToURL:[self preferencesURL] atomically:YES]) {
            [[NSNotificationCenter defaultCenter]postNotificationName:KMBUserDefaultsDidUpdate object:nil];
        }
    }
}

- (NSMutableDictionary *)setupPreferences
{
    
    NSError *error;
    NSData *jsonData = [NSData dataWithContentsOfURL:[self preferencesURL]];
    
    if (jsonData) {
        NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
        
        if (!error && json) {
            return json;
        }
    }
    
    
    return [NSMutableDictionary new];
}

-(NSURL *)documentsDirectory
{
    return [[[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]firstObject]; //first object is optional. might not have an object. making assumption.
}

- (NSURL *)preferencesURL
{
    NSLog(@"%@", [[self documentsDirectory]URLByAppendingPathComponent:@"preferences.json"]);
    return [[self documentsDirectory]URLByAppendingPathComponent:@"preferences.json"];
}




@end
