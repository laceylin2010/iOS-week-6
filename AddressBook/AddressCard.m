//
//  AddressCard.m
//  AddressBook
//
//  Created by Lacey Vu on 3/8/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import "AddressCard.h"

@implementation AddressCard

-(instancetype)initWith:(NSString*)name email:(NSString*)email;
{
    self = [super init];
    if (self) {
        _name = name;
        _email = email;
    }
    return self;
}

-(void)setName: (NSString*)name
{

    if(_name != name){
        [_name release];
        [name retain];
   
        _name = name;
    }
  
}
-(NSString*)name
{
    return _name;
}

-(void)setEmail: (NSString*)email
{
    if (_email != email){
        [_email release];
        [email retain];

        _email = email;
    }
   
}
-(NSString*)email
{
    return _email;
}

-(void)dealloc
{
    [_name release];
    [_email release];
    
    _email = nil;
    _name = nil;
    
    [super dealloc];
    
}

@end

@implementation Do: NSObject

+(id)generateCard

{
    NSArray *cardArray = [NSArray arrayWithObjects:@"firstName", @"lastName", @"email", nil];
    NSMutableArray *mutableCardArray = [[NSMutableArray alloc]init];
    
    NSMutableArray *firstName = [NSMutableArray arrayWithObjects:@"Bob ", @"Bill ", @"John ", @"Paul ", @"Coby ", @"Roger ", nil];
    NSMutableArray *lastName = [NSMutableArray arrayWithObjects:@"Smith",@"Mudd",@"Clue", @"Potter", @"Do", @"Ford", nil];
    NSMutableArray *emails = [NSMutableArray arrayWithObjects:@"bob@gmail.com",@"bill@gmail.com",@"john@yahoo.com",@"paul@aol.com",@"coby@yahoo.com",@"roger@gmail.com", nil];
    
    for (int i = 0; i<cardArray.count; i++) {
        int index = abs((int)arc4random() % 6);
        NSString *name = [NSString stringWithFormat:@"%@" "%@", [firstName objectAtIndex:index], [lastName objectAtIndex:index]];
        NSString *email = [NSString stringWithFormat:@"%@", [emails objectAtIndex:index]];
        
        AddressCard *addressCard = [[AddressCard alloc]initWith:(NSString *)name email:(NSString *)email];
        [mutableCardArray addObject:addressCard];
    }
 
    return mutableCardArray;
   
}

@end









