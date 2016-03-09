//
//  ViewController.m
//  ClassRoster
//
//  Created by Lacey Vu on 3/9/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "StudentStore.h"
#import "CloudBackupService.h"



@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

-(void)updateStudents
{
    __weak typeof(self) weakSelf = self;
    
    [[CloudBackupService sharedService]enqueueOperation:^(BOOL success, NSArray *students) {
        [[StudentStore sharedStore]addStudentsFromCloudKit:students];
        [weakSelf.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    }];
    
}


#pragma mark - UITableViewDataSource



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[StudentStore sharedStore]count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *studentCell  = [tableView dequeueReusableCellWithIdentifier:@"studentCell" forIndexPath:indexPath];
    
    Student *student = [[StudentStore sharedStore]studentsForIndexPath: indexPath];
    
    studentCell.textLabel.text = student.firstName;
    studentCell.detailTextLabel.text = [NSString stringWithFormat:@"Phone: %@", student.phone];
    
    return studentCell;
}


@end
