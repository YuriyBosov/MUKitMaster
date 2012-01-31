//
//  MUKeyboardAvoidingTableController.h
//  MUKitMaster
//
//  Created by Yuriy Bosov on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MUTextField;
@class MUValidationGroup;
@class MUKeyboardAvoidingTableView;

@interface MUKeyboardAvoidingTableController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
{
    MUValidationGroup *validationGroup;
    NSMutableArray *tableViewCells;
}

@property (retain, nonatomic) IBOutlet MUKeyboardAvoidingTableView *tableView;
@property (retain, nonatomic) IBOutlet MUTextField *tf_01;
@property (retain, nonatomic) IBOutlet MUTextField *tf_02;
@property (retain, nonatomic) IBOutlet MUTextField *tf_03;
@property (retain, nonatomic) IBOutlet MUTextField *tf_04;
@property (retain, nonatomic) IBOutlet MUTextField *tf_05;
@property (retain, nonatomic) IBOutlet MUTextField *tf_06;
@property (retain, nonatomic) IBOutlet MUTextField *tf_07;
@property (retain, nonatomic) IBOutlet MUTextField *tf_08;
@property (retain, nonatomic) IBOutlet MUTextField *tf_09;
@property (retain, nonatomic) IBOutlet MUTextField *tf_10;


@end
