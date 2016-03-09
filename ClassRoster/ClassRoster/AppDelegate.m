//
//  AppDelegate.m
//  ClassRoster
//
//  Created by Lacey Vu on 3/9/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application { }

- (void)applicationDidEnterBackground:(UIApplication *)application { }

- (void)applicationWillEnterForeground:(UIApplication *)application { }

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
    ViewController *viewController = (ViewController *)navigationController.viewControllers.firstObject;
    
    [viewController updateStudents];
}

- (void)applicationWillTerminate:(UIApplication *)application { }

@end
