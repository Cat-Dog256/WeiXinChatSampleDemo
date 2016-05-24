//
//  WeiXinChatManager.h
//  MyWeiXinSample
//
//  Created by MoGo on 16/5/20.
//  Copyright © 2016年 李策--MoGo--. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXApi.h"
@protocol WeiXinChatManagerDelegate<NSObject>

@end

@interface WeiXinChatManager : NSObject<WXApiDelegate>
@property (nonatomic, assign) id<WeiXinChatManagerDelegate> delegate;

+ (instancetype)sharedManager;
@end
