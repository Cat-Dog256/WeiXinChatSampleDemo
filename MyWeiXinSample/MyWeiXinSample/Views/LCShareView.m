//
//  LCShareView.m
//  BaKerClub
//
//  Created by MoGo on 15/12/8.
//  Copyright (c) 2015年 MoGo. All rights reserved.
//

#import "LCShareView.h"
#import "shareButton.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface LCShareView (){
    UIView *backView;
}
@property (nonatomic , copy) void(^btnBlock)(NSUInteger btnTag);
@end
@implementation LCShareView

+(instancetype)instanceShareView{
    static dispatch_once_t onceToken;
    static LCShareView *instance;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init{
    
    if (self = [super init]) {
        NSArray *array = @[@"微信好友",@"微信朋友圈"];
        NSArray *image = @[@"iconfont_weixin",@"penyouquna"];
               self.frame = CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.backgroundColor = [UIColor clearColor];
        
       backView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 120)];
        backView.backgroundColor = [UIColor grayColor];
        [self addSubview:backView];
        for (int i=0; i< 2; i++) {
            int maxCol = 2;
            CGFloat imageWH = 60;
            
            CGFloat imageMargin = 10;
            
            
            
            
            int col = i % maxCol;
            CGFloat space = (SCREEN_WIDTH - maxCol * imageWH - imageMargin *(maxCol - 1))/2;
            CGFloat imageX =space + col * (imageWH + imageMargin);
       
            int row = i / maxCol;
            CGFloat imageY = row * (imageWH + imageMargin) + 10;
            CGFloat imageH= imageWH;
            CGFloat imageW = imageWH;
            
            
            shareButton *photoView = [[shareButton alloc]initWithFrame:CGRectMake(imageX, imageY, imageW, imageH) andImage:image[i] andTitle:array[i]];
            photoView.tag = 10 + i;
            [photoView addTarget:self action:@selector(clickShareButton:) forControlEvents:UIControlEventTouchUpInside];
            [backView addSubview:photoView];
            
        }

    }
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 80, SCREEN_WIDTH, 40)];
    button.backgroundColor = [UIColor whiteColor];
    
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"取消" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [backView addSubview:button];
    
    
    
   
   
    return self;
}

- (void)shareViewShow{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:[LCShareView instanceShareView]];
    
    [UIView animateWithDuration:0.26 animations:^{
        backView.frame = CGRectMake(0, SCREEN_HEIGHT - 120, SCREEN_WIDTH, 120);
    }];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [UIView animateWithDuration:0.26 animations:^{
        backView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 120);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];

}
- (void)clickButton:(UIButton *)button{
    [UIView animateWithDuration:0.26 animations:^{
        backView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 120);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)clickShareButton:(UIButton *)button{
    [UIView animateWithDuration:0.26 animations:^{
        backView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 120);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    self.btnBlock(button.tag);
}
- (void)showShareViewWithButtonTagBlock:(void (^)(ShareToType))shareViewBlock{
    [self shareViewShow];
    [self setBtnBlock:^(NSUInteger btnTag) {
        shareViewBlock((int)btnTag);
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
