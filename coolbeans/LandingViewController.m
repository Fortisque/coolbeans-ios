//
//  LandingViewController.m
//  coolbeans
//
//  Created by Kevin Casey on 10/23/14.
//  Copyright (c) 2014 ieor190. All rights reserved.
//

#import "LandingViewController.h"

@interface LandingViewController ()

@end

@implementation LandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _landingMessage.text = [NSString stringWithFormat:@"Welcome, %@", [[NSUserDefaults standardUserDefaults] objectForKey: @"username"]];
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

@end
