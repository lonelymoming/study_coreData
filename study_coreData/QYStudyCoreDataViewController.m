//
//  QYStudyCoreDataViewController.m
//  study_coreData
//
//  Created by MAC on 2016/12/6.
//  Copyright © 2016年 Tsing. All rights reserved.
//

#import "QYStudyCoreDataViewController.h"
#import "QYStudyCell.h"
#import "QYStudyDetailViewController.h"

/**  屏幕宽高   */
#define kHeight [[UIScreen mainScreen] bounds].size.height
#define kWidth [[UIScreen mainScreen] bounds].size.width

@interface QYStudyCoreDataViewController ()<UITableViewDelegate,UITableViewDataSource,QYStudyDetailViewControllerDelegate>
@property(strong,nonatomic)UITableView *m_tableView;
@property(strong,nonatomic)NSArray *dataArray;
@end

@implementation QYStudyCoreDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor lightGrayColor];
    //获取所有用户信息
    _dataArray=[PhoneBook MR_findAll];
    
    [self setupNavUI];
    
    [self createTableView];
    
    
}

-(void)createTableView
{
    _m_tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, kWidth, kHeight-64)];
    _m_tableView.delegate=self;
    _m_tableView.dataSource=self;
    _m_tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    _m_tableView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:_m_tableView];
}

-(void)setupNavUI
{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 64)];
    view.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:view];
    
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(kWidth/2-60, 27, 120, 30)];
    lab.text=@"通讯录";
    lab.textAlignment=NSTextAlignmentCenter;
    lab.font=[UIFont systemFontOfSize:18];
    [view addSubview:lab];
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(kWidth-60, 27, 50, 30)];
    [btn setTitle:@"添加" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
}

-(void)btnClicked
{
    QYStudyDetailViewController *detail=[[QYStudyDetailViewController alloc]init];
    detail.delegate=self;
    [self presentViewController:detail animated:YES completion:nil];
}

-(void)refreashUserInfo
{
    _dataArray=[PhoneBook MR_findAll];
    [_m_tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QYStudyCell *cell=[QYStudyCell cellWithTableView:tableView];
    cell.pb=_dataArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 71;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
