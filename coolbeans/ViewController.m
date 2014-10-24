//
//  ViewController.m
//  coolbeans
//
//  Created by Kevin Casey on 10/23/14.
//  Copyright (c) 2014 ieor190. All rights reserved.
//

#import "ViewController.h"
#import <BuiltIO/BuiltIO.h>
#import "LandingViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
    BuiltUser *user = [BuiltUser user];

    [user loginWithEmail:_usernameField.text
             andPassword:_passwordField.text
               OnSuccess:^{
                   // user has logged in successfully
                   [self performSegueWithIdentifier:@"landing" sender:self];
                   [[NSUserDefaults standardUserDefaults] setObject:_usernameField.text forKey:@"username"];
               } onError:^(NSError *error) {
                   // login failed
                   // error.userinfo contains more details regarding the same
                   NSLog(@"%@", error.userInfo);
                   _welcomeLabel.text = [error.userInfo valueForKey:@"error_message"];
               }];
}

- (IBAction)register:(id)sender {
    BuiltUser *user = [BuiltUser user];
    user.email = _usernameField.text;
    user.password = _passwordField.text;
    user.confirmPassword = _passwordField.text;
    [user signUpOnSuccess:^{
        _welcomeLabel.text = [NSString stringWithFormat:@"Yay, %@ is signed up!", user.email];
    } onError:^(NSError *error) {
        // there was an error in signing up the user
        // error.userinfo contains more details regarding the same
        NSLog(@"%@", error.userInfo);
        _welcomeLabel.text = [error.userInfo valueForKey:@"error_message"];
    }];
}
@end
