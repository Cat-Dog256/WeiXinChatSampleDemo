//
//  LCShareView.h
//  BaKerClub
//
//  Created by MoGo on 15/12/8.
//  Copyright (c) 2015年 MoGo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    WeChatFriends = 10,
    WeChatCircleOfFriends,
}ShareToType;

@interface LCShareView : UIView
+(instancetype)instanceShareView;
- (void)showShareViewWithButtonTagBlock:(void(^)(ShareToType btnType))shareViewBlock;
@end
