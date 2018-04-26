//
//  TVTableViewCell.m
//  ABigFishPlayer
//
//  Created by 陈立宇 on 2018/3/30.
//  Copyright © 2018年 陈立宇. All rights reserved.
//

#import "TVTableViewCell.h"

@implementation TVTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //self.backgroundColor = RGB_255(250, 250, 250);
        [self addTitleLabel];
    }
    return self;
}

-(void)addTitleLabel{
    
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.font = [UIFont systemFontOfSize:14];
    textLabel.textColor = [UIColor darkGrayColor];
    textLabel.textAlignment = NSTextAlignmentLeft;
    //textLabel.text=title;
    [self addSubview:textLabel];
    _titleLab = textLabel;
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _titleLab.frame = CGRectMake(20, 10, 200, 30);
}


@end
