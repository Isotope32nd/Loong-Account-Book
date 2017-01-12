//
//  ViewController.m
//  Loong Account Book
//
//  Created by 神龟网-梁梓龙 on 2016/12/24.
//  Copyright © 2016年 梁梓龙. All rights reserved.
//

#import "LLAccountsViewController.h"

#import "LLRecordData.h"
#import "LLRecordListTableViewCell.h"

#import "LLAddRecordView.h"

@interface LLAccountsViewController ()

@property (strong, nonatomic) NSArray *recordList;

@end

@implementation LLAccountsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _recordList = [LLRecordData recordDatasOnPage:1 pageSize:10];
    [_detailTableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Event Response

- (IBAction)addRecordAction:(UIBarButtonItem *)sender {
    
    LLAddRecordView *addView = [[NSBundle mainBundle]loadNibNamed:@"LLAddRecordView" owner:nil options:nil].firstObject;
    [self.view addSubview:addView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _recordList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *recordCellId = @"RecordListCell";
    LLRecordListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:recordCellId forIndexPath:indexPath];
    
    LLRecordData *recordData = _recordList[indexPath.row];
    cell.typeLabel.text = [NSString stringWithFormat:@"%d", recordData.typeId];
    cell.amountLabel.text = [NSString stringWithFormat:@"%f", recordData.amount];
    
    
    return cell;
}


@end
