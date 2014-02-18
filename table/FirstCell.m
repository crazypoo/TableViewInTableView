//
//  FirstCell.m
//  table
//
//  Created by crazypoo on 7/1/13.
//  Copyright (c) 2013 crazypoo. All rights reserved.
//

#import "FirstCell.h"

@implementation FirstCell
@synthesize haha = _haha;
@synthesize haha1 = _haha1;
@synthesize haha2 = _haha2;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _haha = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        _haha.text = @"hahaha";
        [self.contentView addSubview:_haha];
        _haha1 = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 100, 20)];
        _haha1.text = @"hahaha1";
        [self.contentView addSubview:_haha1];
        _haha2 = [[UILabel alloc] initWithFrame:CGRectMake(180, 0, 100, 20)];
        _haha2.text = @"hahaha2";
        [self.contentView addSubview:_haha2];
        self.selectionStyle = UITableViewScrollPositionNone;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
