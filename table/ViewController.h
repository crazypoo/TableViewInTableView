//
//  ViewController.h
//  table
//
//  Created by crazypoo on 7/1/13.
//  Copyright (c) 2013 crazypoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSInteger endSection;
    NSInteger didSection;
    BOOL ifOpen;
}

@end
