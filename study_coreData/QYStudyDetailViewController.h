//
//  QYStudyDetailViewController.h
//  study_coreData
//
//  Created by MAC on 2016/12/6.
//  Copyright © 2016年 Tsing. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QYStudyDetailViewControllerDelegate <NSObject>

-(void)refreashUserInfo;

@end

@interface QYStudyDetailViewController : UIViewController

@property(nonatomic,strong)id<QYStudyDetailViewControllerDelegate>delegate;

@end
