//
//  MUKeyboardAvoidingTableController.m
//  MUKitMaster
//
//  Created by Yuriy Bosov on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MUKeyboardAvoidingTableController.h"
#import "MUTextField.h"
#import "MUValidator.h"
#import "MUValidationGroup.h"
#import "MUKeyboardAvoidingTableView.h"

#define tag_text_field 100

@interface MUKeyboardAvoidingTableController ()

- (MUTextField *)createTextField;
- (UITableViewCell *)createTableViewCell;
- (void)validationAllInputValue;

@end

@implementation MUKeyboardAvoidingTableController

@synthesize tableView;
@synthesize tf_01;
@synthesize tf_02;
@synthesize tf_03;
@synthesize tf_04;
@synthesize tf_05;
@synthesize tf_06;
@synthesize tf_07;
@synthesize tf_08;
@synthesize tf_09;
@synthesize tf_10;

//==============================================================================
- (id)init
{
    self = [super initWithNibName:@"MUKeyboardAvoidingTableController" bundle:nil];
    if (self) 
    {
        self.title = @"TableView";
    }
    return self;
}

//==============================================================================
- (void)dealloc 
{
    [tableViewCells release];
    [validationGroup release];
    [tableView release];
    [tf_01 release];
    [tf_02 release];
    [tf_03 release];
    [tf_04 release];
    [tf_05 release];
    [tf_06 release];
    [tf_07 release];
    [tf_08 release];
    
    [super dealloc];
}

#pragma mark - View lifecycle
//==============================================================================
- (void)viewDidLoad
{
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Validation" style:UIBarButtonItemStyleDone target:self action:@selector(validationAllInputValue)] autorelease];    
    
    NSMutableArray *sectionFirst = [NSMutableArray array];
    NSMutableArray *sectionSecond = [NSMutableArray array];
    tableViewCells = [[NSMutableArray alloc] initWithObjects:sectionFirst, sectionSecond, nil];
    
    // create cells and textfields
    UITableViewCell *cell = nil;
 
    tf_01 = [[self createTextField] retain];
    cell = [self createTableViewCell];
    [cell.contentView addSubview:tf_01];
    [sectionFirst addObject:cell];
    
    tf_02 = [[self createTextField] retain];
    cell = [self createTableViewCell];
    [cell.contentView addSubview:tf_02];
    [sectionFirst addObject:cell];
    
    tf_03 = [[self createTextField] retain];
    cell = [self createTableViewCell];
    [cell.contentView addSubview:tf_03];
    [sectionFirst addObject:cell];
    
    tf_04 = [[self createTextField] retain];
    cell = [self createTableViewCell];
    [cell.contentView addSubview:tf_04];
    [sectionFirst addObject:cell];
    
    tf_05 = [[self createTextField] retain];
    cell = [self createTableViewCell];
    [cell.contentView addSubview:tf_05];
    [sectionFirst addObject:cell];
    
    tf_06 = [[self createTextField] retain];    
    cell = [self createTableViewCell];
    [cell.contentView addSubview:tf_06];
    [sectionSecond addObject:cell];
    
    tf_07 = [[self createTextField] retain];
    cell = [self createTableViewCell];
    [cell.contentView addSubview:tf_07];
    [sectionSecond addObject:cell];
    
    tf_08 = [[self createTextField] retain];
    cell = [self createTableViewCell];
    [cell.contentView addSubview:tf_08];
    [sectionSecond addObject:cell];
    
    tf_09 = [[self createTextField] retain];
    cell = [self createTableViewCell];
    [cell.contentView addSubview:tf_09];
    [sectionSecond addObject:cell];
    
    tf_10 = [[self createTextField] retain];
    cell = [self createTableViewCell];
    [cell.contentView addSubview:tf_10];
    [sectionSecond addObject:cell];

    // create vaidators
    MUValidator *validator = [[[MUValidatorNotEmpty alloc] init] autorelease];
    validator.errorMessage = @"TextField not Empty";
    tf_01.placeholder = @"Not Empty";
    tf_01.validator = validator;
    
    validator = [[[MUValidatorEmail alloc] init] autorelease];
    validator.errorMessage = @"Incorrect Email";
    tf_02.placeholder = @"Email";
    tf_02.validator = validator;
    
    validator = [[[MUValidatorEqual alloc] initWithTestedField:tf_02] autorelease];
    validator.errorMessage = @"Not Confirmation Email";
    tf_03.placeholder = @"Confirmation Email";
    tf_03.validator = validator;
    
    validator = [[[MUValidatorFullName alloc] init] autorelease];
    validator.errorMessage = @"Incorrect Full Name";
    tf_04.placeholder = @"Full Name";
    tf_04.validator = validator;
    
    validator = [[[MUValidatorIntWithRange alloc] initWithRange:NSMakeRange(10, 5)] autorelease];
    validator.errorMessage = @"Incorrect Code";
    tf_05.placeholder = @"Enter Code (10~15 symbol)";
    tf_05.validator = validator;
    
    validator = [[[MUValidatorLetters alloc] init] autorelease];
    validator.errorMessage = @"Letters!!!";
    tf_06.placeholder = @"Enter Letters";
    tf_06.validator = validator;
    
    validator = [[[MUValidatorNumber alloc] init] autorelease];
    validator.errorMessage = @"Number!!!";
    tf_07.placeholder = @"Enter Number";
    tf_07.validator = validator;
    
    validator = [[[MUValidatorURL alloc] init] autorelease];
    validator.errorMessage = @"Incorrect URL";
    tf_08.placeholder = @"Enter URL";
    tf_08.validator = validator;
    
    validator = [[[MUValidatorUSAZipCode alloc] init] autorelease];
    validator.errorMessage = @"Incorrect Zip Code";
    tf_09.placeholder = @"Enter Zipc Code";
    tf_09.validator = validator;
    
    validator = [[[MUValidatorWords alloc] init] autorelease];
    validator.errorMessage = @"Words!!!";
    tf_10.placeholder = @"Enter Words";
    tf_10.validator = validator;
    
    [tableView addObjectsForKeyboard:[NSArray arrayWithObjects:tf_01, tf_02, tf_03, tf_04, tf_05, tf_06, tf_07, tf_08, tf_09, tf_10, nil]];
    validationGroup = [[MUValidationGroup alloc] initWithTextFields:[NSArray arrayWithObjects:tf_01, tf_02, tf_03, tf_04, tf_05, tf_06, tf_07, tf_08, tf_09, tf_10, nil]];
    validationGroup.invalidIndicatorImage = [UIImage imageNamed:@"warning_icon"];
    
    [super viewDidLoad];
}

//==============================================================================
- (void)viewDidUnload
{
    [self setTableView:nil];
    [self setTf_01:nil];
    [self setTf_02:nil];
    [self setTf_03:nil];
    [self setTf_04:nil];
    [self setTf_05:nil];
    [self setTf_06:nil];
    [self setTf_07:nil];
    [self setTf_08:nil];
    
    [validationGroup release];
    validationGroup = nil;

    [tableViewCells release];
    tableViewCells = nil;
    
    [super viewDidUnload];
}

//==============================================================================
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark - Private Method
//==============================================================================
- (MUTextField *)createTextField
{
    MUTextField *textField = [[[MUTextField alloc] initWithFrame:CGRectMake(10, 0, 300, 40)] autorelease];
    textField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    textField.autoresizesSubviews = YES;
    textField.delegate = self;
    textField.tag = tag_text_field;
    return textField;
}

//==============================================================================
- (UITableViewCell *)createTableViewCell
{
    UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"] autorelease];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.autoresizesSubviews = YES;
    return cell;
}

#pragma mark - Button Action
//==============================================================================
- (void)validationAllInputValue
{
    [tableView hideKeyBoard];
    
    NSString *alertTitle = nil;
    NSString *alertText = nil;
    
    NSArray *errorFields = [validationGroup validateFields];
    if ([errorFields count] > 0) 
    {
        id<MUValidationProtocol> obj = [errorFields objectAtIndex:0];
        alertText = [obj validator].errorMessage;
        alertTitle = @"Error";
    }
    else
    {
        alertText = @"Validation Success";
    }
    
    [[[[UIAlertView alloc] initWithTitle:alertTitle message:alertText delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] autorelease] show];
}

#pragma mark - UITableViewDataSource
//==============================================================================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [tableViewCells count];
}

//==============================================================================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[tableViewCells objectAtIndex:section] count];
}

//==============================================================================
-(UITableViewCell*)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[tableViewCells objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
}

#pragma mark - UITextFieldDelegate
//==============================================================================
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [tableView adjustOffset];
}

//==============================================================================
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [tableView responderShouldReturn:textField];
    return YES;
}

@end
