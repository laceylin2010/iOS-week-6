//
//  main.m
//  AddressBook
//
//  Created by Lacey Vu on 3/8/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "AddressCard.h"


int main(int argc, char * argv[]) {
    @autoreleasepool
    {

        NSMutableArray *randomArray = [Do generateCard];
        NSLog(@"%@", [randomArray[1] name]);
        
        AddressCard *addressCard = [[[AddressCard alloc]init]autorelease];
        NSLog(@"%li", [addressCard retainCount]);

        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}


