//
//  SecondCell.m
//  table
//
//  Created by crazypoo on 7/1/13.
//  Copyright (c) 2013 crazypoo. All rights reserved.
//

#import "SecondCell.h"

@implementation SecondCell
@synthesize haha = _haha;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _haha = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 20)];
        _haha.text = @"hahahahahaha";
        [self.contentView addSubview:_haha];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
