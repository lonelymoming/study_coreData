//
//  QYStudyDetailViewController.m
//  study_coreData
//
//  Created by MAC on 2016/12/6.
//  Copyright © 2016年 Tsing. All rights reserved.
//

#import "QYStudyDetailViewController.h"
#import "PhoneBook+CoreDataProperties.h"
/**  屏幕宽高   */
#define kHeight [[UIScreen mainScreen] bounds].size.height
#define kWidth [[UIScreen mainScreen] bounds].size.width

@interface QYStudyDetailViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)PhoneBook *pb;
@end

@implementation QYStudyDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithWhite:0.8f alpha:1.0f];
    
    _pb=[PhoneBook MR_createEntity];
    
    [self setupNavUI];
    
    [self setupMainUI];
}

-(void)setupNavUI
{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 64)];
    view.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:view];
    
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(kWidth/2-60, 27, 120, 30)];
    lab.text=@"添加用户";
    lab.textAlignment=NSTextAlignmentCenter;
    lab.font=[UIFont systemFontOfSize:18];
    [view addSubview:lab];
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(kWidth-60, 27, 50, 30)];
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
}

-(void)btnClicked
{
    //把用户信息存入沙盒
    [[NSManagedObjectContext MR_defaultContext] MR_save];
    [self.delegate refreashUserInfo];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)setupMainUI
{
    UIView *mainView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 120)];
    mainView.backgroundColor=[UIColor whiteColor];
    mainView.center=self.view.center;
    [self.view addSubview:mainView];

    NSArray *titleArray=@[@"请输入名字",@"请输入电话号码",@"请输入邮箱"];
    for (int i=0; i<titleArray.count; i++) {
        UITextField *txtField=[[UITextField alloc]initWithFrame:CGRectMake(10, 5+40*i, 180, 30)];
        txtField.backgroundColor=[UIColor lightGrayColor];
        txtField.placeholder=titleArray[i];
        txtField.tag=i;
        [txtField addTarget:self action:@selector(textFieldDidChanged:) forControlEvents:UIControlEventEditingChanged];
        [mainView addSubview:txtField];
    }
}

-(void)textFieldDidChanged:(UITextField *)textField
{
    switch (textField.tag) {
        case 0:
            _pb.name=textField.text;
            break;
        case 1:
            _pb.phonenumber=textField.text;
            break;
        case 2:
            _pb.email=textField.text;
            break;
        default:
            break;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
