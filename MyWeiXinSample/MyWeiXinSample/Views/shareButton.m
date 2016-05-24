//
//  shareButton.m
//  BaKerClub
//
//  Created by MoGo on 15/12/8.
//  Copyright (c) 2015年 MoGo. All rights reserved.
//

#import "shareButton.h"

@implementation shareButton
- (instancetype)initWithFrame:(CGRect)frame andImage:(NSString *)imageName andTitle:(NSString *)title{
    if (self = [super initWithFrame:frame]) {
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, self.frame.size.width - 20, self.frame.size.width - 20)];
        imageV.image = [UIImage imageNamed:imageName];
        imageV.contentMode = UIViewContentModeCenter;
        imageV.layer.cornerRadius = imageV.frame.size.width/2;
        imageV.layer.masksToBounds = YES;
        imageV.backgroundColor = [UIColor whiteColor];
        [self addSubview:imageV];
        
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, imageV.frame.size.width, self.frame.size.width, 20)];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = title;
        label.font = [UIFont systemFontOfSize:12];
        [self addSubview:label];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
