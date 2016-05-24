//
//  WeiXinShareViewController.m
//  MyWeiXinSample
//
//  Created by MoGo on 16/5/20.
//  Copyright © 2016年 李策--MoGo--. All rights reserved.
//

#import "WeiXinShareViewController.h"
#import "LCShareView.h"
#import "WXApi.h"
@interface WeiXinShareViewController ()

@end

@implementation WeiXinShareViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)TextAction:(UIButton *)sender {
    [[LCShareView instanceShareView] showShareViewWithButtonTagBlock:^(ShareToType btnType) {
        switch (btnType) {
            case WeChatFriends:
                NSLog(@"微信好友");
                [self WXsendReqWithScene:WXSceneSession];
                break;
            case WeChatCircleOfFriends:
                [self WXsendReqWithScene:WXSceneTimeline];
                NSLog(@"微信朋友圈");
            default:
                break;
        }
    }];
}

- (IBAction)LinkAction:(UIButton *)sender {
    WXWebpageObject *ext = [WXWebpageObject object];
    ext.webpageUrl = @"http://blog.csdn.net/qq_32031183/article/details/51170563";
    
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"沉淀繁华";
    message.description = @"iOS技术博客";
    message.mediaObject = ext;
    message.messageExt = nil;
    message.messageAction = nil;
    message.mediaTagName = nil;
    [message setThumbImage:[UIImage imageNamed:@"iconfont_weixin"]];
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.scene = WXSceneSession;
    req.message = message;
    [WXApi sendReq:req];

}

- (IBAction)ImageAction:(UIButton *)sender {
}

- (IBAction)MusicAction:(UIButton *)sender {
}

- (IBAction)VideoActon:(UIButton *)sender {
}
- (void)pressShareButton:(UIButton *)button{
    
}
- (void)WXsendReqWithScene:(enum WXScene)scene{
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.bText = YES;
    req.scene = scene;
    req.text = @"发送Text消息给微信";
    [WXApi sendReq:req];
}
@end
