//
//  QYStudyCell.m
//  study_coreData
//
//  Created by MAC on 2016/12/6.
//  Copyright © 2016年 Tsing. All rights reserved.
//

#import "QYStudyCell.h"
/**  屏幕宽高   */
#define kHeight [[UIScreen mainScreen] bounds].size.height
#define kWidth [[UIScreen mainScreen] bounds].size.width

@interface QYStudyCell ()
@property(nonatomic,strong)UILabel *nameLab;
@property(nonatomic,strong)UILabel *pNumLab;
@property(nonatomic,strong)UILabel *emailLab;
@end

@implementation QYStudyCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID=@"studyCell";
    QYStudyCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell=[[QYStudyCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        
        UIView *mainView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 70)];
        mainView.backgroundColor=[UIColor whiteColor];
        
        _nameLab=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 200, 20)];
        _nameLab.font=[UIFont systemFontOfSize:14];
        [mainView addSubview:_nameLab];
        
        _pNumLab=[[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(_nameLab.frame), 200, 20)];
        _pNumLab.font=[UIFont systemFontOfSize:14];
        [mainView addSubview:_pNumLab];
        
        _emailLab=[[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(_pNumLab.frame), 200, 20)];
        _emailLab.font=[UIFont systemFontOfSize:14];
        [mainView addSubview:_emailLab];
        
        [self.contentView addSubview:mainView];
    }
    return self;
}

-(void)setPb:(PhoneBook *)pb
{
    _pb=pb;
    
    _nameLab.text=[NSString stringWithFormat:@"名字:%@",_pb.name];
    
    _pNumLab.text=[NSString stringWithFormat:@"电话:%@",_pb.phonenumber];
    
    _emailLab.text=[NSString stringWithFormat:@"邮箱:%@",_pb.email];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
