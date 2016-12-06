//
//  QYStudyCell.h
//  study_coreData
//
//  Created by MAC on 2016/12/6.
//  Copyright © 2016年 Tsing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhoneBook+CoreDataProperties.h"

@interface QYStudyCell : UITableViewCell

@property(nonatomic,strong)PhoneBook *pb;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
