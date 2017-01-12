//
//  ViewController.h
//  Loong Account Book
//
//  Created by 神龟网-梁梓龙 on 2016/12/24.
//  Copyright © 2016年 梁梓龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LLRecordData;
@class LLAddRecordView;

@interface LLAccountsViewController : UIViewController <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *remainingLabel;
@property (weak, nonatomic) IBOutlet UITableView *detailTableView;

@end

