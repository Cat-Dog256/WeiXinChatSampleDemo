//
//  ViewController.m
//  MyWeiXinSample
//
//  Created by MoGo on 16/5/20.
//  Copyright © 2016年 李策--MoGo--. All rights reserved.
//

#import "ViewController.h"
#import "WeiXinPayViewController.h"
#import "WeiXinShareViewController.h"
@interface ViewController ()
- (IBAction)payAction:(UIButton *)sender;
- (IBAction)shareAction:(UIButton *)sender;
- (IBAction)loginAction:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)payAction:(UIButton *)sender {
    WeiXinPayViewController *payVC = [[WeiXinPayViewController alloc]init];
    [self presentViewController:payVC animated:YES completion:nil];
}

- (IBAction)shareAction:(UIButton *)sender {
    WeiXinShareViewController *shareVC = [[WeiXinShareViewController alloc]init];
    [self presentViewController:shareVC animated:YES completion:nil];
}

- (IBAction)loginAction:(UIButton *)sender {
}
@end
