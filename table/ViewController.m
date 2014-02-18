//
//  ViewController.m
//  table
//
//  Created by crazypoo on 7/1/13.
//  Copyright (c) 2013 crazypoo. All rights reserved.
//

#import "ViewController.h"
#import "FirstCell.h"
#import "SecondCell.h"
@interface ViewController ()
@property (nonatomic, retain)UITableView *lol;
@property (nonatomic, retain)NSMutableArray *array;
@property (nonatomic, retain)UIImageView *imageview;
@end

@implementation ViewController
@synthesize lol = _lol;
@synthesize array = _array;
@synthesize imageview = _imageview;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _array = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
    
    _lol = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
    _lol.scrollEnabled = YES;
    [_lol setSeparatorColor:[UIColor lightGrayColor]];
    _lol.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    _lol.dataSource = self;
    _lol.delegate = self;
    [self.view addSubview:self.lol];
    didSection = _array.count + 1;
}
#pragma mark - about tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == didSection) {
        return 4;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        static NSString *CellIdentifier = @"FirstCell";
        
        FirstCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell == nil)
        {
             cell = [[FirstCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        return cell;
    }
    else{
        static NSString *CellIdentifier = @"SecondCell";
        
        SecondCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell == nil)
        {
            cell = [[SecondCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];

            cell.selectionStyle = UITableViewCellSelectionStyleNone;

        }
        return cell;
    }
    
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_array count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == didSection) {
        return 30;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(10, 0, 300, 30)];
    [view setBackgroundColor:[UIColor clearColor]];
    UILabel *lol = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 300, 30)];
    lol.text = @"Section";
    [view addSubview:lol];
    _imageview = [[UIImageView alloc]initWithFrame:CGRectMake(290, 10, 14.5, 9)];
    [_imageview setImage:[UIImage imageNamed:@"fs_common_down_arrow.png"]];
    [view addSubview:_imageview];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(10, 0, 300, 30)];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTag:section];
    [button addTarget:self action:@selector(addCell:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    return view;
}

#pragma mark - cell增加
- (void)addCell:(UIButton *)button{
    endSection = button.tag;
    if (didSection == _array.count + 1) {
        ifOpen = NO;
        didSection = endSection;
        [self didSelectCellRowFirstDo:YES nextDo:NO];
    }
    else{
        if (didSection == endSection) {
            [self didSelectCellRowFirstDo:NO nextDo:NO];
        }
        else{
            [self didSelectCellRowFirstDo:NO nextDo:YES];
        }
    }
}
- (void)didSelectCellRowFirstDo:(BOOL)firstDoInsert nextDo:(BOOL)nextDoInsert{
    [_lol beginUpdates];
    ifOpen = firstDoInsert;
    //隨著numberOfRowsInSection的個數而變化數量，要不然會導致table更新的時候刪減引發隊列不匹配而引發程序crash
    NSMutableArray* rowToInsert = [[NSMutableArray alloc] init];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:didSection];
    [rowToInsert addObject:indexPath];
    NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:1 inSection:didSection];
    [rowToInsert addObject:indexPath1];
    NSIndexPath *indexPath2 = [NSIndexPath indexPathForRow:2 inSection:didSection];
    [rowToInsert addObject:indexPath2];
    NSIndexPath *indexPath3 = [NSIndexPath indexPathForRow:3 inSection:didSection];
    [rowToInsert addObject:indexPath3];
    //
    
    if (!ifOpen) {
        didSection = _array.count + 1;
        [_lol deleteRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationFade];
    }else{
        [_lol insertRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationFade];
    }
    [_lol endUpdates];
    if (nextDoInsert) {
        didSection = endSection;
        [self didSelectCellRowFirstDo:YES nextDo:NO];
    }
    [_lol scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
