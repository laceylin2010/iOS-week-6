//
//  Animal.h
//  Week6Day1
//
//  Created by Lacey Vu on 3/7/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Animal <NSObject>

-(void) bark;
-(void) sit;
-(void) play;

@optional

-(void) fetch;

@end
