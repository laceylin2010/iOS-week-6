//
//  AddressCard.h
//  AddressBook
//
//  Created by Lacey Vu on 3/8/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressCard : NSObject
{
    NSString *_name;
    NSString *_email;

}

-(instancetype)initWith:(NSString*)name email:(NSString*)email;

-(void)setName: (NSString*)name;
-(NSString*)name;

-(void)setEmail: (NSString*)email;
-(NSString*)email;

@end


@interface Do : NSObject

+(id)generateCard;

@end



