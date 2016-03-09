//
//  ModelStudent.m
//  ClassRoster
//
//  Created by Lacey Vu on 3/9/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import "Student.h"


@interface Student() <NSCoding>



@end


@implementation Student

-(instancetype)initWithFirstName:(NSString*)firstName
                        lastName: (NSString*)lastName
                           email: (NSString*)email
                           phone:(NSString*)phone;

{
    self = [super init];
    if(self) {
        _firstName = firstName;
        _lastName = lastName;
        _phone = phone;
        _email = email;
    }
    
    return self;
}

-(instancetype)init
{
    [NSException raise: @"initWithFirstName:lastName:email:phone:" format: @"Please use desginated initializer. "]; return nil;
}

-(void)setFirstName:(NSString *)firstName
{
    if (_firstName != firstName){
        _firstName = [firstName copy];
    }
}
-(NSString *)firstName
{
    return _firstName;
}

-(void)setLastName:(NSString *)lastName
{
    if (_lastName != lastName) {
        _lastName = [lastName copy];
    }
}
-(NSString *)lastName
{
    return _lastName;
}

-(void)setEmail:(NSString *)email
{
    if (_email != email) {
        _email = [email copy];
    }
}
-(NSString *)email
{
    return _email;
}

-(void)setPhone:(NSString *)phone
{
    if (_phone != phone) {
        _phone = [phone copy];
    }
}
-(NSString *)phone
{
    return _phone;
}

#pragma mark - Override

-(NSString *)description
{
    return [NSString stringWithFormat:@"FirstName: %@ lastName: %@ Email: %@ Phone: %@",
            self.firstName,
            self.lastName,
            self.email,
            self.phone];
}

#pragma mark - NSCoding

-(instancetype)initWithCoder:(NSCoder *)aDecoder //getting straight from method
{
    NSString *firstName = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(firstName))];
    NSString *lastName = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(lastName))];
    NSString *email = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(email))];
    NSString *phone = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(phone))];
    
    return [self initWithFirstName:firstName lastName:lastName email:email phone:phone];
    
}

-(void)encodeWithCoder: (NSCoder *)aCoder
{
    [aCoder encodeObject:self.firstName forKey:NSStringFromSelector(@selector(firstName))];
    [aCoder encodeObject:self.lastName forKey:NSStringFromSelector(@selector(lastName))];
    [aCoder encodeObject:self.email forKey:NSStringFromSelector(@selector(email))];
    [aCoder encodeObject:self.phone forKey:NSStringFromSelector(@selector(phone))];
}

@end
