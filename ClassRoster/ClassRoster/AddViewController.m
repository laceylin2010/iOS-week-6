//
//  AddViewController.m
//  ClassRoster
//
//  Created by Lacey Vu on 3/9/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import "AddViewController.h"
#import "Student.h"
#import "Student+Additions.h"
#import "StudentStore.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;

@property (strong, nonatomic) Student *student;


- (IBAction)saveButton:(UIButton *)sender;

@end

@implementation AddViewController

+(NSString *)identifier
{
    return NSStringFromClass(self);
}


-(Student *)student
{
    if (!_student) {
        _student = [[Student alloc]initWithFirstName:@""
                                            lastName:@""
                                               email:@""
                                               phone:@""];
    }
    return _student;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

-(void)showAlertView
{
    NSString *title = @"Err..";
    NSString *message = @"Please fill out all the required information.";
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    [controller addAction:okAction];
    [self presentViewController:controller animated:YES completion:nil];
}



- (IBAction)saveButton:(UIButton *)sender {
    
    self.student.firstName = self.firstNameField.text;
    self.student.lastName = self.lastNameField.text;
    self.student.email = self.emailField.text;
    self.student.phone = self.phoneField.text;
    
    if (self.student.isValidStudent) {
        [[StudentStore sharedStore]add:self.student];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}



@end
