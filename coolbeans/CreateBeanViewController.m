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
@property (strong, nonatomic) UITableView *autocompleteTableView;
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
    
    _commentField.text = @"";
    
    _autocompleteTableView = [[UITableView alloc] initWithFrame:
                             CGRectMake(0, 80, 320, 120) style:UITableViewStylePlain];
    _autocompleteTableView.delegate = self;
    _autocompleteTableView.dataSource = self;
    _autocompleteTableView.scrollEnabled = YES;
    _autocompleteTableView.hidden = YES;
    [self.view addSubview:_autocompleteTableView];
    
    _businessField.delegate = self;
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

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *beanTableIdentifier = @"BeanTableViewCell";
    
    BeanTableViewCell *cell = (BeanTableViewCell *)[tableView dequeueReusableCellWithIdentifier:beanTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:beanTableIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.businessLabel.text = @"hi";
    cell.commentLabel.text = @"hi";
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

#pragma mark - Autocomplete

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    _autocompleteTableView.hidden = NO;
    
    NSString *substring = [NSString stringWithString:textField.text];
    substring = [substring
                 stringByReplacingCharactersInRange:range withString:string];
    [self searchAutocompleteEntriesWithSubstring:substring];
    return YES;
}

- (void)searchAutocompleteEntriesWithSubstring:(NSString *)substring {
    
    [_autocompleteTableView reloadData];
}

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
