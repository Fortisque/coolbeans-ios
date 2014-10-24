//
//  BeanTableViewCell.h
//  coolbeans
//
//  Created by Kevin Casey on 10/23/14.
//  Copyright (c) 2014 ieor190. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BeanTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *businessLabel;
@property (nonatomic, weak) IBOutlet UILabel *commentLabel;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;

@end
