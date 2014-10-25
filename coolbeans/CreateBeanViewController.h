//
//  CreateBeanViewController.h
//  coolbeans
//
//  Created by Kevin Casey on 10/23/14.
//  Copyright (c) 2014 ieor190. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BeanTableViewCell.h"

@interface CreateBeanViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *businessField;
@property (strong, nonatomic) IBOutlet UITextView *commentField;
- (IBAction)submitBean:(id)sender;

@end
