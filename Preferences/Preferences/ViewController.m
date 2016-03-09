//
//  ViewController.m
//  Preferences
//
//  Created by Lacey Vu on 3/8/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import "ViewController.h"
#import "MBUserDefaults.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *switchControl;

- (IBAction)switchChanged:(UISwitch *)sender;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.switchControl setOn:[[[MBUserDefaults sharedDefaults]objectForKey:@"preferences"]boolValue] animated:YES];

}

- (IBAction)switchChanged:(UISwitch *)sender
{
    [[MBUserDefaults sharedDefaults]setObject:@(sender.isOn) key:@"preferences"];
    
}
@end
