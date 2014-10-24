//
//  CreateBeanViewController.m
//  coolbeans
//
//  Created by Kevin Casey on 10/23/14.
//  Copyright (c) 2014 ieor190. All rights reserved.
//

#import "CreateBeanViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <BuiltIO/BuiltIO.h>

@interface CreateBeanViewController ()

@end

@implementation CreateBeanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //To make the border look very close to a UITextField
    [_commentField.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [_commentField.layer setBorderWidth:2.0];
    
    //The rounded corner part, where you specify your view's corner radius:
    _commentField.layer.cornerRadius = 5;
    _commentField.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)submitBean:(id)sender {
    BuiltObject *obj = [BuiltObject objectWithClassUID:@"bean"];
    [obj setObject:_businessField.text
            forKey:@"business"];
    [obj setObject:_commentField.text
            forKey:@"comment"];
    [obj saveEventuallyOnSuccess:^{
        NSLog(@"%@", obj);
    } onError:^(NSError *error) {
        // there was an error in creating the object
        // error.userinfo contains more details regarding the same
        NSLog(@"%@", error.userInfo);
    }];
}
@end
